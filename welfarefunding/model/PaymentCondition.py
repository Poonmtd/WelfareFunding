from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.CheckBoxInput import CheckBoxInput
from xerial.input.NumberInput import NumberInput
from xerial.input.TextInput import TextInput
from typing import List
from datetime import datetime, timedelta



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
	
	# async def check(self, member:FundingMember) -> bool:
	# 	sameappliance:list[WelfareAppliance] = await self.session.selectByID(WelfareAppliance ,int(self.welfareID))
	# 	totalAmount = sum(WelfareAppliance.Amount for i in sameappliance)

	# 	print('printAmoutn:',totalAmount)
  
	# 	if totalAmount > self.maxperYear :
	# 		return False
	# 	return True
 
	async def check(self, member:FundingMember) -> bool:
		print('paymentttttttttttttttttttttttttttttttttttttttttttttt')
		# from welfarefunding.model.WelfareAppliance import WelfareAppliance
		for memberapply in member :
			memberid = memberapply.id
   
		today = datetime.today()
		desired_date = today.replace(year=today.year - 1,month=10, day=1)
  
		clause = 'WHERE isDrop = ? AND member = ? AND ApplianceDate >= ?'
		model:List[WelfareAppliance] = await self.session.select(WelfareAppliance, clause, parameter=[0,memberid,desired_date])

		print('check payment')
  
		for memberAppliance in model:
			print('WelfareAppliance Select')
			if model.welfareType == self.welfareID:
				amount += memberAppliance.Amount
		# if WelfareAppliance.member == memberid:
		# 	amount = sum(WelfareAppliance.Amount for i in WelfareAppliance)
   
		if amount > self.maxperYear :
			return False
		# # i: WelfareAppliance
		# # for i in self.rightCondition:
		# # 	if not i.check(member): return False
		return True
