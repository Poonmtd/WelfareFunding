from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.Children import Children

from xerial.input.RichTextInput import RichTextInput
from xerial.input.TextInput import TextInput
from xerial.input.ReferenceRadioInput import ReferenceSelectInput

from welfarefunding.model.FundingMember import FundingMember
from typing import List

class WelfareCondition(Record):
	welfareName = StringColumn(
		isRepresentative=True,
		length=100,
		input=TextInput(
			label="ชื่อสวัสดิการ",
			isRequired=True,
			isTable=True,
			order="1.0"
		)
	)

	# welfareDescription = StringColumn(
	# 	length=200,
	# 	input=TextInput(
	# 		label="รายละเอียดของสวัสดิการ",
	# 		isRequired=True,
	# 		isTable=True,
	# 		order="2.0"
	# 	)
	# )
	# welfareType = IntegerColumn(
	# 	default=-1,
	# 	foreignKey="WelfareType.id",
	# 	input=ReferenceSelectInput(
	# 		label="ประเภทสวัสดิการ",
	# 		url="welfarefunding/welfaretype/option/get",
	# 		order="1.0",
	# 		isRequired=True,
	# 		isTable=True,
	# 		isSearch=True
	# 	)
	# )

	# welfareCondition = StringColumn(
	# 	isRepresentative=True,
	# 	input=RichTextInput(
	# 		label="เงื่อนไขการรับสวัสดิการ",
	# 		order="2.0",
	# 		isRequired=True,
	# 		isTable=True
	# 	)
	# )

	paymentCondition = Children('PaymentCondition.id', isTableForm=True)
	rightCondition = Children('RightCondition.id', isTableForm=True)



	isDrop = IntegerColumn(
		default=0
	)

	def check(self, member:FundingMember) -> bool:
		print('-------------check' , member)
		if not self.checkRight(member): return False
		return self.checkPayment(member)
 
	def checkRight(self, member:FundingMember) -> bool:
		from welfarefunding.model.RightCondition import RightCondition
		i: RightCondition
		for i in self.rightCondition:
			if not i.check(member): return False
		return True
  
	def checkPayment(self, member:FundingMember) -> bool:
		from welfarefunding.model.PaymentCondition import PaymentCondition
		i: PaymentCondition
		for i in self.paymentCondition:
			if not i.check(member): return False
		return True

	def modify(self):
		modification = self.createModification("2.0")
		modification.add("isDrop", IntegerColumn(default=0))
