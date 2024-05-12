from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.StringColumn import StringColumn

from xerial.input.DateInput import DateInput
from xerial.input.TextInput import TextInput



class FundDocument(Record):
	nameDocument = StringColumn(
		input=TextInput(
			label="ชื่อเอกสาร",
			isTable=True,
			isRequired=True,
			order="1.0"
		)
	)


	startYear = DateColumn(
		input=DateInput(
			label="เอกสารกองทุนตั้งเเต่วันที่",
			isRequired=True,
			order="1.1"
		)
	)

	endYear = DateColumn(
		input=DateInput(
			label="เอกสารกองทุนสิ้นสุดวันที่",
			isRequired=True,
			order="2.0"
		)
	)
	
	isDrop = IntegerColumn(
		default=0
	)
	
	def modify(self):
		modification = self.createModification("2.1")
		modification.add("isDrop", IntegerColumn(default=0))
		modification = self.createModification("2.2")
		modification.add("nameDocument", StringColumn(''))
