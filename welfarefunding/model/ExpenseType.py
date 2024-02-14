from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.TextInput import TextInput
from xerial.input.RichTextInput import RichTextInput


class ExpenseType(Record):
	expenseName = StringColumn(
		isRepresentative=True,
		length=100,
		input=TextInput(
			label="ประเภทรายจ่าย",
			isRequired=True,
			isTable=True,
			order="1.0"
		)
	)

	expenseDescription = StringColumn(
		length=200,
		input=RichTextInput(
			label="รายละเอียด",
			isRequired=False,
			isTable=True,
			order="2.0"
		)
	)