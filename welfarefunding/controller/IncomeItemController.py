from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.IncomeItem import IncomeItem
from typing import List, Dict
from welfarefunding.model.SavingFund import SavingFund
from welfarefunding.model.BudgetFund import BudgetFund

from sanic import response
import os, string, random
from weasyprint import HTML

@BASE(IncomeItem, "/welfarefunding/incomeitem", "welfarefunding.IncomeItem")
class IncomeItemController(BaseController):
    def __init__(self, application):
        super().__init__(application)
        
    # @GET("/welfarefunding/incomeitem/get/all/income")
    # async def getIncomeItemOption(self, request) :
    #     income_clause = 'WHERE isDrop = ? ORDER BY id DESC'
    #     models_income:List[IncomeItem] = await self.session.select(IncomeItem, income_clause, parameter=[0])
        
    #     saving_clause = 'WHERE isDrop = ?'
    #     models_saving:List[SavingFund] = await self.session.select(SavingFund, saving_clause, parameter=[0])
        
    #     combined_data = []
        
    #     for income in models_income :
    #         combined_data.append({
    #             'incomeType': income.incomeType,
    #             'PaymentDate': income.PaymentDate,
    #             'memberID' : income.memberID,
    #             'Amount' : income.Amount,
    #             'incomeDescription' : income.incomeDescription
    #         })
            
    #     for saving in models_saving :
    #         combined_data.append({
    #             'incomeType': '4',
    #             'PaymentDate': saving.savingDate,
    #             'memberID' : saving.memberID,
    #             'Amount' : saving.savingAmount,
    #             'incomeDescription' : 'เงินสมทบจากสมาชิก'
    #         })
        
    #         combined_data.sort(key=lambda x: x['PaymentDate'], reverse=True)    
            
    #     print(combined_data)    
        
    #     return Success(combined_data)
    

    @GET("/welfarefunding/incomeitem/get/all/income")
    async def getIncomeItemOption(self, requests) :
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
        
         
    @GET('/welfarefunding/documentincome/by/id/get/<id>', role=['user'])
    async def getDocumentIncome(self, request, id):
        model = await self.session.select(IncomeItem, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        path = await self.generateDocumentIncomePDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentIncomePDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/DocumentIncome.tpl')
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
