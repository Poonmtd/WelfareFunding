from xerial.Record import Record
from welfarefunding.model.IncomeType import IncomeType

from xerial.IntegerColumn import IntegerColumn
from xerial.input.EnumSelectInput import EnumSelectInput

class IncomeItem(Record):
    expenseType = IntegerColumn(
        input=EnumSelectInput(
            label="ประเภทรายรับ",
            isRequired=True,
            enum=IncomeType,
            order="1.0"
        )
    )

    
