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
        calculate = await self.calculateIncome()
        template = self.theme.getTemplate('welfarefunding/TestCalculate.tpl')
        data['font'] = font
        data['calculate'] = calculate
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
    
    @GET("/welfarefunding/incomeitem/get/all/income")
    async def getIncomeItemOption(self, request) :
        return self.calculateIncome()
    
    async def calculateIncome(self):
        print("-----------------------------------TEST-----------------------------------------------------")
        income_clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models_income:List[IncomeItem] = await self.session.select(IncomeItem, income_clause, parameter=[0])
        
        saving_clause = 'WHERE isDrop = ?'
        models_saving:List[SavingFund] = await self.session.select(SavingFund, saving_clause, parameter=[0])
        
        budget_clause = 'WHERE isDROP = ?'
        models_budget:List[BudgetFund] = await self.session.select(BudgetFund, budget_clause, parameter=[0])
        
        income_dict: Dict[str, float] = {}
        
        for income in models_income :
            income_type = income.incomeType
            paymentAmount = income.Amount
            
            income_dict.setdefault(income_type,0)
            income_dict[income_type] += paymentAmount
            
        for saving in models_saving :
            income_type = '1'
            paymentAmount = saving.savingAmount
            
            income_dict.setdefault(income_type,0)
            income_dict[income_type] += paymentAmount
            
        for budget in models_budget :
            if budget.budgetStatus == "SUCCESS" :
                income_type = budget.budgetType
                paymentAmount = budget.budgetFundAmount
            
                income_dict.setdefault(income_type,0)
                income_dict[income_type] += paymentAmount
        
        combined_data = [(income_type,paymentAmount) for income_type,paymentAmount in income_dict.items()]

        print(combined_data)   
        
        return Success(combined_data)