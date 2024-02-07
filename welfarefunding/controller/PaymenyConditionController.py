from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.PaymentCondition import PaymentCondition

@BASE(PaymentCondition, "/welfarefunding/paymentcondition", "welfarefunding.PaymentCondition")
class PaymentConditionController(BaseController):
    def __init__(self, application):
        super().__init__(application)