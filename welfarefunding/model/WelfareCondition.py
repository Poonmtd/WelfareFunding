from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.Children import Children

from xerial.input.RichTextInput import RichTextInput
from xerial.input.ReferenceRadioInput import ReferenceSelectInput

class WelfareCondition(Record):
	welfareType = IntegerColumn(
		default=-1,
		foreignKey="WelfareType.id",
		input=ReferenceSelectInput(
			label="ประเภทสวัสดิการ",
			url="welfarefunding/welfaretype/option/get",
			order="1.0",
			isRequired=True,
			isTable=True,
			isSearch=True
		)
	)

	# welfareCondition = StringColumn(
	# 	isRepresentative=True,
	# 	input=RichTextInput(
	# 		label="เงื่อนไขการรับสวัสดิการ",
	# 		order="2.0",
	# 		isRequired=True,
	# 		isTable=True
	# 	)
	# )

	PaymentCondition = Children('PaymentCondition.id', isTableForm=True)

	RightCondition = Children('RightCondition.id', isTableForm=True)



	isDrop = IntegerColumn(
		default=0
	)

	def modify(self):
		modification = self.createModification("2.0")
		modification.add("isDrop", IntegerColumn(default=0))