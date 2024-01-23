from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.ExpenseType import ExpenseType
# Record.appendGroup(User, 'Member', 50, '2.0')

class FundingExpense(Record):

    ExpenseType = IntegerColumn(
        input=EnumSelectInput(
            label="ประเภทรายจ่าย",
            isRequired=True,
            enum=ExpenseType,
            order="1.0"
        )
    )

    ExpenseItem = StringColumn(
        input=TextInput(
            label="รายละเอียด",
            isRequired=True,
            order="2.0"
        )
    )

    Amount = IntegerColumn(
        length=20,
        input=NumberInput(
            label="จำนวนเงิน",
            isRequired=True,
            order="3.0"
        )
    )

    PaymentDate = DateColumn(

    )