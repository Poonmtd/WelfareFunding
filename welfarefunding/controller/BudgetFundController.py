from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
	RESTResponse as REST,
	ErrorRESTResponse as Error,
	SuccessRESTResponse as Success
)
from welfarefunding.model.BudgetFund import BudgetFund
from welfarefunding.model.BudgetStatus import BudgetStatus

@BASE(BudgetFund, "/welfarefunding/budgetfund", "welfarefunding.BudgetFund")
class BudgetFundController(BaseController):
	def __init__(self, application):
		super().__init__(application)
		
	@GET("/welfarefunding/budgetfund/enum/get", role=['guest'])
	async def getENUM(self, request) :
		result = {
			'BUDGET_STATUS': {i:BudgetStatus.__members__[i].value for i in BudgetStatus.__members__},
			'BUDGET_STATUS_LABEL': BudgetStatus.label,
			'BUDGET_STATUS_COLOR': BudgetStatus.color
		}
		return Success(result)