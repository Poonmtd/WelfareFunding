from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.IncomeItem import IncomeItem
from typing import List
from welfarefunding.model.SavingFund import SavingFund

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