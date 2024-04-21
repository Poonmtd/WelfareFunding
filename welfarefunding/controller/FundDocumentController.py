from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.FundDocument import FundDocument
from welfarefunding.model.IncomeItem import IncomeItem
from welfarefunding.model.ExpenseItem import ExpenseItem
from welfarefunding.model.BudgetFund import BudgetFund
from welfarefunding.model.SavingFund import SavingFund
from welfarefunding.model.WelfareAppliance import WelfareAppliance
from welfarefunding.model.AboutFund import AboutFund

from sanic import response
import os, string, random
from weasyprint import HTML
from typing import List, Dict

@BASE(FundDocument, "/welfarefunding/funddocument", "welfarefunding.FundDocument")
class FundDocumentController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET('/welfarefunding/documentfundperyear/by/id/get/<id>', role=['user'])
    async def getDocumentFundPerYear(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        path = await self.generateDocumentFundPerYearPDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentFundPerYearPDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/DocumentFundPerYear.tpl')
        data['font'] = font
        html = self.renderer.render(template, data)
        letters = string.ascii_lowercase
        fileName = ''.join(random.choice(letters) for i in range(20))
        path = self.resourcePath + "upload/welfarefunding/document"
        os.makedirs(path, exist_ok=True)
        pathFile = path + "/%s.pdf" % (fileName)
        html = HTML(string=html)
        html.write_pdf(pathFile)
        pathUpload = "welfarefunding/document/%s.pdf" % (fileName)
        print('--------------- GENERATE PDF FINISHED ---------------')
        return pathUpload
    
    async def getFont(self):
        font = self.theme.getTemplate('welfarefunding/FontFamily.tpl')
        font = self.renderer.render(font, {})
        return font
    
    @GET('/welfarefunding/testcalculate/by/id/get/<id>', role=['user'])
    async def getDocumentTestCalculate(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        path = await self.generateDocumentTestCalculatePDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentTestCalculatePDF(self, data):
        font = await self.getFont()
        calculateIncome, calculateAllIncome = await self.calculateIncome()
        calculateExpense ,calculateAllExpense = await self.calculateExpense()
        calculateWelfareAppliance = await self.calculateWelfareAppliance()
        template = self.theme.getTemplate('welfarefunding/TestCalculate.tpl')
        data['font'] = font
        data['calculateIncome'] = calculateIncome
        data['calculateAllIncome'] = calculateAllIncome
        data['calculateExpense'] = calculateExpense
        data['calculateAllExpense'] = calculateAllExpense
        data['calculateWelfareAppliance'] = calculateWelfareAppliance
        html = self.renderer.render(template, data)
        letters = string.ascii_lowercase
        fileName = ''.join(random.choice(letters) for i in range(20))
        path = self.resourcePath + "upload/welfarefunding/document"
        os.makedirs(path, exist_ok=True)
        pathFile = path + "/%s.pdf" % (fileName)
        html = HTML(string=html)
        html.write_pdf(pathFile)
        pathUpload = "welfarefunding/document/%s.pdf" % (fileName)
        print('--------------- GENERATE PDF FINISHED ---------------')
        print(calculateIncome)
        print(data)
        print('------------------------------------------------------')
        return pathUpload
    
    @GET("/welfarefunding/incomeitem/get/all/income")
    async def getIncomeItemOption(self, request) :
        return self.calculateIncome()
    
    async def calculateIncome(self):
        print("-----------------------------------TEST CALCURATE-----------------------------------------------------")
        income_clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models_income:List[IncomeItem] = await self.session.select(IncomeItem, income_clause, parameter=[0])
        
        saving_clause = 'WHERE isDrop = ?'
        models_saving:List[SavingFund] = await self.session.select(SavingFund, saving_clause, parameter=[0])

        budget_clause = 'WHERE isDROP = ?'
        models_budget:List[BudgetFund] = await self.session.select(BudgetFund, budget_clause, parameter=[0]) 
        
        income_dict: Dict[str, float] = {}
        incomeAll_dict: Dict[str, float] ={}
        
        for income in models_income :
            income_type = str(income.incomeType)
            paymentAmount = income.Amount
            
            income_dict.setdefault(income_type,0.00)
            income_dict[income_type] += paymentAmount
            
            incomeAll_dict.setdefault('รายรับ',0.00)
            incomeAll_dict['รายรับ'] += paymentAmount
            incomeAll_dict.setdefault('รวมรายรับ',0.00)
            incomeAll_dict['รวมรายรับ'] += paymentAmount
            
        for saving in models_saving :
            income_type = 'เงินสมทบจากสมาชิก'
            paymentAmount = saving.savingAmount
            
            income_dict.setdefault(income_type,0.00)
            income_dict[income_type] += paymentAmount
            incomeAll_dict.setdefault('รายรับ',0.00)
            incomeAll_dict['รายรับ'] += paymentAmount
            incomeAll_dict.setdefault('รวมรายรับ',0.00)
            incomeAll_dict['รวมรายรับ'] += paymentAmount
            
        for budget in models_budget :
            income_type = str(budget.budgetType)
            paymentAmount = budget.budgetFundAmount
            if budget.budgetStatus == 3 :
                income_dict.setdefault(income_type,0.00)
                income_dict[income_type] += paymentAmount   # budtype ยังไปรวมกัน income type อยู่เพราะว่าตัวเลขเป็นตัวเลขเดียวกัน
                incomeAll_dict.setdefault('รายได้',0.00)
                incomeAll_dict['รายได้'] += paymentAmount
                incomeAll_dict.setdefault('รวมรายรับ',0.00)
                incomeAll_dict['รวมรายรับ'] += paymentAmount
        
        # combined_data = [(income_type,paymentAmount) for income_type,paymentAmount in income_dict.items()]
        # print(income_dict)
        return income_dict ,incomeAll_dict
        
        # return Success(income_dict)
        
    async def calculateExpense(self) :
        print("-----------------------------------TEST EXPENSE-----------------------------------------------------")
        
        expense_clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models_expense:List[ExpenseItem] = await self.session.select(ExpenseItem, expense_clause, parameter=[0])
        
        walfareAppliance_clause = 'WHERE isDrop = ?'
        models_welfareAppliance:List[WelfareAppliance] = await self.session.select(WelfareAppliance, walfareAppliance_clause, parameter=[0])
        
        aboutfund_clause = 'WHERE isDrop = ?'
        models_aboutfund:List[AboutFund] = await self.session.select(AboutFund, aboutfund_clause, parameter=[0])
        
        expense_dict: Dict[str, float] = {}
        expenseAll_dict: Dict[str, float] = {}
        
        for expense in models_expense :
            expense_type = str(expense.expenseType)
            paymentAmount = expense.Amount
            
            expense_dict.setdefault(expense_type,0.00)
            expense_dict[expense_type] += paymentAmount ## if ธนาคารหมู่บ้านต้องไปอยู่ใน รายจ่าย
            expenseAll_dict.setdefault('ค่าใช้จ่าย',0.00)
            expenseAll_dict['ค่าใช้จ่าย'] += paymentAmount
            expenseAll_dict.setdefault('รวมรายจ่าย',0.00)
            expenseAll_dict['รวมรายจ่าย'] += paymentAmount
            
        for welfare in models_welfareAppliance :
            expense_type = 'จ่ายสวัสดิการให้สมาชิก'
            paymentAmount = welfare.Amount
            
            expense_dict.setdefault(expense_type,0.00)
            expense_dict[expense_type] += paymentAmount
            expenseAll_dict.setdefault('รายจ่าย',0.00)
            expenseAll_dict['รายจ่าย'] += paymentAmount
            expenseAll_dict.setdefault('รวมรายจ่าย',0.00)
            expenseAll_dict['รวมรายจ่าย'] += paymentAmount
        
        for aboutfund in models_aboutfund:
            if aboutfund.bankBalance is not None:
                expense_dict.setdefault('เงินฝากธนาคาร',0.00)
                expense_dict['เงินฝากธนาคาร'] += aboutfund.bankBalance
                expenseAll_dict.setdefault('รายจ่าย',0.00)
                expenseAll_dict['รายจ่าย'] += paymentAmount
                expenseAll_dict.setdefault('รวมรายจ่าย',0.00)
                expenseAll_dict['รวมรายจ่าย'] += paymentAmount  
            
            if aboutfund.cash is not None:
                expense_dict.setdefault('เงินสดในมือ',0.00)
                expense_dict['เงินสดในมือ'] += aboutfund.cash
                expenseAll_dict.setdefault('รายจ่าย',0.00)
                expenseAll_dict['รายจ่าย'] += paymentAmount
                expenseAll_dict.setdefault('รวมรายจ่าย',0.00)
                expenseAll_dict['รวมรายจ่าย'] += paymentAmount
            
                
        # combined_data = [(income_type,paymentAmount) for income_type,paymentAmount in income_dict.items()]
        # print(expense_dict)
        return expense_dict, expenseAll_dict
    
    async def calculateWelfareAppliance(self) :
        clause = 'WHERE isDrop = ?'
        models:List[WelfareAppliance] = await self.session.select(WelfareAppliance, clause, parameter=[0])
        
        appliancs_dict: Dict[str, float] = {}
        
        for appliance in models :
            welfare_type = str(appliance.welfareType)
            paymentAmount = appliance.Amount
            
            appliancs_dict.setdefault(welfare_type,0.00)
            appliancs_dict[welfare_type] += paymentAmount
            
            appliancs_dict.setdefault('จำนวนคนของ'+welfare_type, 0.00)
            appliancs_dict['จำนวนคนของ'+welfare_type] += 1  
        
        return appliancs_dict