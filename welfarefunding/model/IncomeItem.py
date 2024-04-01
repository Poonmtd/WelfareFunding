from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.StringColumn import StringColumn

from xerial.input.ReferenceRadioInput import ReferenceSelectInput
from xerial.input.DateInput import DateInput
from xerial.input.TextInput import TextInput
from xerial.input.RichTextInput import RichTextInput
from xerial.input.NumberInput import NumberInput

class IncomeItem(Record):
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

    PaymentDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปี",
			isRequired=True,
			order="2.0"
		)
	)

    memberID = StringColumn(
        length=100,
        input=TextInput(
            label="ชื่อผู้รับเงิน",
            isRequired=True,
            order="3.0"
        )
    )

    incomeDescription = StringColumn(
		length=200,
		input=RichTextInput(
			label="รายละเอียด",
			isRequired=False,
			isTable=True,
			order="4.0"
		)
	)

    Amount = IntegerColumn(
        length=20,
        input=NumberInput(
            label="จำนวนเงิน",
            isRequired=True,
            order="5.0"
        )
    )
