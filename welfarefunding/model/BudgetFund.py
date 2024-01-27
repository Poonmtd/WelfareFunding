from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.input.DateInput import DateInput
from xerial.input.NumberInput import NumberInput

from xerial.input.EnumSelectInput import EnumSelectInput

from welfarefunding.model.BudgetStatus import BudgetStatus

class BudgetFund(Record):
    budgetFundDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปีที่ทำการยื่นของบ",
			isRequired=True,
			order="1.0"
		)
	)

    budgetFundAmount = IntegerColumn(
        input=NumberInput(
            label="จำนวนงบประมาณ",
            isRequired=True,
            order="2.0"
        )
    )

    BudgetStatus = IntegerColumn(
		input=EnumSelectInput(
			label="สถานะ",
			isRequired=True,
			enum=BudgetStatus,
			order="3.0"
		)
	)

    







    

