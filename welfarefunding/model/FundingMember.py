from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput

from welfarefunding.model.Gender import Gender
# Record.appendGroup(User, 'Member', 50, '2.0')

class FundingMember(Record):
    uid = IntegerColumn(foreignKey="User.id")

    citizenID = IntegerColumn(
        length=20,
        input=NumberInput(
            label="เลขบัตรประชาชน",
            isTable=True,
            isRequired=True,
            order="1.0"
        )
    )

    birthday = DateColumn(
        input=DateInput(
            label="วัน/เดือน/ปีเกิด",
            isRequired=True,
            order="2.0"
        )
    )

    applyDate = DateColumn(
        input=DateInput(
            label="วัน/เดือน/ปีสมัคร",
            isRequired=True,
            order="3.0"
        )
    )

    gender = IntegerColumn(
        input=EnumSelectInput(
            label="เพศ",
            isRequired=True,
            enum=Gender,
            order="4.0"
        )
    )

    