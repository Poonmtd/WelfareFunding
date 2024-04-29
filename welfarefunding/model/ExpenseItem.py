from xerial.Record import Record

from xerial.DateColumn import DateColumn
from xerial.IntegerColumn import IntegerColumn
from xerial.StringColumn import StringColumn

from xerial.input.ReferenceSelectInput import ReferenceSelectInput
from xerial.input.DateInput import DateInput
from xerial.input.TextInput import TextInput
from xerial.input.RichTextInput import RichTextInput
from xerial.input.NumberInput import NumberInput
from xerial.input.AutoCompleteInput import AutoCompleteInput

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

    PaymentDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปี",
			isRequired=True,
			order="2.0"
		)
	)

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

    expenseDescription = StringColumn(
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

    expenseAmountText = StringColumn(
        input=TextInput(
            label="จำนวนเงิน(ตัวอักษร)",
            isTable=False,
            isRequired=True,
            order="1.3"
        )
    )


    isDrop = IntegerColumn(
	    default=0
	)
    
    def modify(self):
            modification = self.createModification("2.0")
            modification.add("isDrop", IntegerColumn(default=0))