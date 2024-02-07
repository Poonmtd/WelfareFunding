from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.ReferenceRadioInput import ReferenceSelectInput
from xerial.input.DateInput import DateInput

class ExpenseItem(Record):
    expenseType = IntegerColumn(
        default=-1,
        foreignKey="ExpenseType.id",
        input=ReferenceSelectInput(
            label="ประเภทรายจ่าย",
            url="welfarefunding/expensetype/option/get",
            isRequired=True,
            isTable=True,
            isSearch=True,
            order="1.0"
        )
    )

    
