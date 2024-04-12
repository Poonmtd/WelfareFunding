from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.IncomeType import IncomeType
from typing import List

@BASE(IncomeType, "/welfarefunding/incometype", "welfarefunding.IncomeType")
class IncomeTypeController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET("/welfarefunding/incometype/option/get", role=['Audit'])
    async def getIncomeTypeOption(self, request) :
        clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models:List[IncomeType] = await self.session.select(IncomeType, clause, parameter=[0])
        return Success([i.toOption() for i in models])

