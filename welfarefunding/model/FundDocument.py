from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.DateInput import DateInput



class FundDocument(Record):
	startYear = DateColumn(
		input=DateInput(
			label="เอกสารกองทุนตั้งเเต่วันที่",
			isRequired=True,
			order="1.0"
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
