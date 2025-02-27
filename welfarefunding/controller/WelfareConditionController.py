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
	
	@POST("/welfarefunding/welfarecondition/option/get", role=['Welfare'])
	async def getOption(self, request):
		id = request.json['id']
		print('------------------------',id)
		# member = await self.session.selectByID(FundingMember,int(id))
		# print(member)
		member:List[FundingMember] = await self.session.select(FundingMember, 'WHERE uid = ?', parameter=[int(id)], limit=1)
		if member is None: return Error('')
		
		print("print------------------member : ",member)
		for i in member:
			gender1 = i.gender
			print("genderrrrr",gender1)
		
		clause = 'WHERE isDrop = ? ORDER BY id DESC'
		model:List[WelfareCondition] = await self.session.select(WelfareCondition, clause, parameter=[0], hasChildren=True)
		if len(model) == 0: return Error('')
		
		
		# result = True
		# for i in model:
		#     if not i.check(member):
		#         result = False
		#         break
		filtered_models = [i for i in model if i.check(member)]
		print("type:",filtered_models)
		return Success([i.toOption() for i in filtered_models])
	
	@POST("/welfarefunding/welfarecondition/option/getByIDList", role=['Welfare'])
	async def getOptionByIDList(self, request):
		IDList = request.json['IDList']
		if len(IDList) == 0: return {}
		IDList = [int(i) for i in IDList]
		IDclause = ",".join(len(IDList)*'?')
		clause = f"WHERE id IN ({IDclause})"
		fetched = await self.session.select(WelfareCondition, clause, parameter=IDList, isRelated=False)
		return Success({i.id: i.toOption() for i in fetched})