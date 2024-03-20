from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.WelfareCondition import WelfareCondition
from welfarefunding.model.RightCondition import RightCondition
from welfarefunding.model.FundingMember import FundingMember
from typing import List

@BASE(WelfareCondition, "/welfarefunding/welfarecondition", "welfarefunding.WelfareCondition")
class WelfareConditionController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    # @GET("/welfarefunding/welfarecondition/option/get", role=['Welfare'])
    # async def getUpdatesConditionOption(self, request) :
    #     clause = 'WHERE isDrop = ? ORDER BY id DESC'
    #     models:List[WelfareCondition] = await self.session.select(WelfareCondition, clause, parameter=[0])
    #     return Success([i.toOption() for i in models])
    
    @POST("/welfarefunding/welfareappliance/option/get", role=['Welfare'])
    async def getOption(self, request):
        id = request.json[id]
        member = await self.session.selectByID(FundingMember,int(id))
        if member is None: return Error()
        member = member.toDict()
        
        clause = 'WHERE isDrop = ?'
        model = await self.session.select(WelfareCondition, clause, parameter=[0], hasChilden=True)
        if len(model) == 0: return Error()
        option = []
        model = [i.toDict() for i in model]
        print(model)
        for item in model:
            rigthCondition = item['rightCondition']
            if member['gender'] != rigthCondition['gender']: continue
            # if member['age'] != rigthCondition['age']: continue
            option.append(item)
        # return Success(option)
        # print(option)
        return Success(option)
