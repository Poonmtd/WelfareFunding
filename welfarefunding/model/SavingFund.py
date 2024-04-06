from xerial.Record import Record

from xerial.IntegerColumn import IntegerColumn
from xerial.DateTimeColumn import DateTimeColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn

from xerial.input.NumberInput import NumberInput
from xerial.input.DateTimeInput import DateTimeInput
from xerial.input.DateInput import DateInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.FundingMember import FundingMember
from xerial.input.AutoCompleteInput import AutoCompleteInput

class SavingFund(Record):
    memberID = IntegerColumn(
            default=-1,
            foreignKey='User.id',
            input=AutoCompleteInput(
                label='สมาชิก',
                order='1.0',
                url='user/autoComplete/get',
                template='{{{firstName}}} {{{lastName}}}',
                tableURL='user/option/getByIDList',
                isTable=True,
                isSearch=True,
                isRequired=True
            )
        )

    savingAmount = IntegerColumn(
        input=NumberInput(
            label="จำนวนเงินออม",
			isRequired=True,
            isTable=True,
			order="1.0"
        )
    )

    savingAmountText = StringColumn(
        input=TextInput(
            label="จำนวนเงินออม(ตัวอักษร)",
            isTable=False,
            isRequired=True,
            order="1.1"
        )
    )

    savingDate = DateColumn(
        input=DateInput(
            label="วัน/เดือน/ปีที่ทำการออม",
            isRequired=True,
            order="2.0"
        )
    )
