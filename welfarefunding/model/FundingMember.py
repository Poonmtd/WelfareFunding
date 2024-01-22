from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.Gender import Gender
from welfarefunding.model.Status import Status
# Record.appendGroup(User, 'Member', 50, '2.0')

class FundingMember(Record):
    uid = IntegerColumn(foreignKey="User.id")

    citizenID = IntegerColumn(
        length=20,
        input=NumberInput(
            label="เลขบัตรประชาชน (13 หลัก)",
            isTable=True,
            isRequired=True,
            order="1.0"
        )
    )

    telephoneNumber = IntegerColumn(
        length=20,
        input=NumberInput(
            label="หมายเลขโทรศัพท์",
            isRequired=True,
            order="1.1"
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

    maritalStatus = IntegerColumn(
        input=EnumSelectInput(
            label="สถานภาพ",
            isRequired=True,
            enum=Status,
            order="5.0"
        )
    )

    grantee_one = StringColumn(
        input=TextInput(
            label="ผู้รับสิทธิ์คนที่ 1",
            isRequired=True,
            order="6.0"
        )
    )

    grantee_two = StringColumn(
        input=TextInput(
            label="ผู้รับสิทธิ์คนที่ 2",
            isRequired=True,
            order="7.0"
        )
    )