from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.TextInput import TextInput
from xerial.input.RichTextInput import RichTextInput

class IncomeType(Record):
	incomeName = StringColumn(
		isRepresentative=True,
		length=100,
		input=TextInput(
			label="ประเภทรายรับ",
			isRequired=True,
			isTable=True,
			isSearch=True,
			order="1.0"
		)
	)

	incomeDescription = StringColumn(
		length=200,
		input=RichTextInput(
			label="รายละเอียด",
			isRequired=False,
			isTable=True,
			order="2.0"
		)
	)
       
	isDrop = IntegerColumn(
        default=0
	)
        
	def modify(self):
			modification = self.createModification("2.0")
			modification.add("isDrop", IntegerColumn(default=0))
