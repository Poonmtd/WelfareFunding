from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.WelfareCondition import WelfareCondition
from typing import List

@BASE(WelfareCondition, "/welfarefunding/welfarecondition", "welfarefunding.WelfareCondition")
class WelfareConditionController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET("/welfarefunding/welfarecondition/option/get", role=['Welfare'])
    async def getUpdatesConditionOption(self, request) :
        clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models:List[WelfareCondition] = await self.session.select(WelfareCondition, clause, parameter=[0])
        return Success([i.toOption() for i in models])
