from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.ExpenseType import ExpenseType
from typing import List

@BASE(ExpenseType, "/welfarefunding/expensetype", "welfarefunding.ExpenseType")
class ExpenseTypeController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET("/welfarefunding/expensetype/option/get", role=['Audit'])
    async def getExpenseTypeOption(self, request) :
        clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models:List[ExpenseType] = await self.session.select(ExpenseType, clause, parameter=[0])
        return Success([i.toOption() for i in models])
