from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.input.DateInput import DateInput
from xerial.input.NumberInput import NumberInput
from xerial.StringColumn import StringColumn

from xerial.input.EnumSelectInput import EnumSelectInput

from welfarefunding.model.BudgetStatus import BudgetStatus
from welfarefunding.model.BudgetType import BudgetType

class BudgetFund(Record):
	budgetFundDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปีที่ทำการยื่นของบ",
			isRequired=True,
			order="1.0"
		)
	)
	
	budgetType = IntegerColumn(
		input=EnumSelectInput(
			label="ประเภทของงบประมาณ",
			isRequired=True,
			isTable=True,
			enum=BudgetType,
			order="1.1"
		)
	)

	budgetFundAmount = IntegerColumn(
		input=NumberInput(
			label="จำนวนงบประมาณ",
			isRequired=True,
			isTable=True,
			order="2.0"
		)
	)

	budgetStatus = IntegerColumn(
		input=EnumSelectInput(
			label="สถานะ",
			isRequired=True,
			enum=BudgetStatus,
			order="3.0",
		)
	)
	
	isDrop = IntegerColumn(
		default=0
	)

	def modify(self):
		modification = self.createModification("2.1")
		modification.add("isDrop", IntegerColumn(default=0))
