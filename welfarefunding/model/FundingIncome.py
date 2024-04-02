from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput
from xerial.input.ReferenceRadioInput import ReferenceSelectInput


from welfarefunding.model.IncomeType import IncomeType
# Record.appendGroup(User, 'Member', 50, '2.0')

class FundingIncome(Record):

    incomeType = IntegerColumn(
        default=-1,
        foreignKey="IncomeType.id",
        input=ReferenceSelectInput(
            label="ประเภทรายรับ",
            url="welfarefunding/incometype/option/get",
            isRequired=True,
            isTable=True,
            isSearch=True,
            order="1.0"
        )
    )

    IncomeItem = StringColumn(
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
            isTable=True,
            order="3.0"
        )
    )

    PaymentDate = DateColumn(
        input=DateInput(
            label="วัน/เดือน/ปี",
            isRequired=True,
            isTable=True,
            order="4.0"
        )
    )
    