from xerial.Record import Record

from xerial.StringColumn import StringColumn
from xerial.IntegerColumn import IntegerColumn

from xerial.input.CheckBoxInput import CheckBoxInput
from xerial.input.NumberInput import NumberInput
from xerial.input.TextInput import TextInput

class PaymentCondition(Record):
    description = StringColumn(
        input=TextInput(
            label="รายละเอียด",
            order="1.0"
        )
    )

    unlimited = IntegerColumn(
        input=CheckBoxInput(
            label="ไม่มีกำหนด",
            option= ["ไม่กำหนด"],
            order="1.1"
        )
    )

    perDay = IntegerColumn(
        input=NumberInput(
            label="ต่อวัน",
            order="2.0"
        )
    )

    perWeek = IntegerColumn(
        input=NumberInput(
            label="ต่อสัปดาห์",
            order="3.0"
        )
    )

    perYear = IntegerColumn(
        input=NumberInput(
            label="ต่อเดือน",
            order="4.0"
        )
    )

    