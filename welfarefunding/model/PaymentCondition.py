from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.CheckBoxInput import CheckBoxInput
from xerial.input.NumberInput import NumberInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.FundingMember import FundingMember
from welfarefunding.model.WelfareAppliance import WelfareAppliance

class PaymentCondition(Record):
	description = StringColumn(
		input=TextInput(
			label="รายละเอียด",
			order="1.0"
		)
	)

	# unlimited = IntegerColumn(
	# 	input=CheckBoxInput(
	# 		label="ไม่มีกำหนด",
	# 		option= ["ไม่กำหนด"],
	# 		order="1.1"
	# 	)
	# )

	amount = IntegerColumn(
		input=NumberInput(
			label="จำนวนเงินต่อครั้ง(บาท)",
			order="1.5"
		)
	)

	perDay = IntegerColumn(
		input=NumberInput(
			label="จำนวนเงินต่อวัน(บาท)",
			order="2.0"
		)
	)

	perWeek = IntegerColumn(
		input=NumberInput(
			label="จำนวนเงินต่อสัปดาห์(บาท)",
			order="3.0"
		)
	)

	perMonth = IntegerColumn(
		input=NumberInput(
			label="จำนวนเงินต่อเดือน(บาท)",
			order="4.0"
		)
	)

	perYear = IntegerColumn(
		input=NumberInput(
			label="จำนวนเงินต่อปี(บาท)",
			order="5.0"
		)
	)
	
	maxperYear = IntegerColumn(
		input=NumberInput(
			label="จำนวนเงินสูงสุงต่อปี(บาท)",
			order="6.0"
		)
	)
 
	welfareID = IntegerColumn(foreignKey="WelfareCondition.id")
	
	def check(self, member:FundingMember ,appliance:WelfareAppliance) -> bool:
		sameappliance:list[appliance] = appliance.session.selectByID(WelfareAppliance ,int(self.welfareID))
		totalAmount = sum(appliance.Amount for i in sameappliance)
  
		if totalAmount > self.maxperYear :
			return False

		return True