from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.WelfareType import WelfareType
from typing import List

@BASE(WelfareType, "/welfarefunding/welfaretype", "welfarefunding.WelfareType")
class WelfareTypeController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET("/welfarefunding/welfaretype/option/get", role=['Welfare'])
    async def getWelfareFundingTypeOption(self, request) :
        clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models:List[WelfareType] = await self.session.select(WelfareType, clause, parameter=[0])
        return Success([i.toOption() for i in models])
