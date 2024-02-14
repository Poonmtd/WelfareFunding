from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.Position import Position
from typing import List

@BASE(Position, "/welfarefunding/position", "welfarefunding.Position")
class PositionController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET("/welfarefunding/position/option/get", role=['FundingMember'])
    async def getPositionOption(self, request) :
        clause = 'WHERE isDrop = ? ORDER BY id DESC'
        models:List[Position] = await self.session.select(Position, clause, parameter=[0])
        return Success([i.toOption() for i in models])
