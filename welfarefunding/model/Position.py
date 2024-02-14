from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.TextInput import TextInput
from xerial.input.RichTextInput import RichTextInput


class Position(Record):
	positionName = StringColumn(
		isRepresentative=True,
		length=100,
		input=TextInput(
			label="ตำแหน่งในกองทุน",
			isRequired=True,
			isTable=True,
			order="1.0"
		)
	)
