from xerial.Record import Record
from welfarefunding.model.ExpenseType import ExpenseType

from xerial.IntegerColumn import IntegerColumn
from xerial.input.EnumSelectInput import EnumSelectInput

class ExpenseItem(Record):
    expenseType = IntegerColumn(
        input=EnumSelectInput(
            label="ประเภทรายจ่าย",
            isRequired=True,
            enum=ExpenseType,
            order="1.0"
        )
    )
