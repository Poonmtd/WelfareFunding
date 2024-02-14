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

    amount = IntegerColumn(
        input=NumberInput(
            label="จำนวนเงิน(บาท)",
            order="1.5"
        )
    )

    perDay = IntegerColumn(
        input=NumberInput(
            label="ต่อวัน(บาท)",
            order="2.0"
        )
    )

    perWeek = IntegerColumn(
        input=NumberInput(
            label="ต่อสัปดาห์(บาท)",
            order="3.0"
        )
    )

    perMonth = IntegerColumn(
        input=NumberInput(
            label="ต่อเดือน(บาท)",
            order="4.0"
        )
    )

    perYear = IntegerColumn(
        input=NumberInput(
            label="ต่อปี(บาท)",
            order="5.0"
        )
    )
    
    maxperYear = IntegerColumn(
        input=NumberInput(
            label="จำนวนเงินสูงสุงต่อปี(บาท)",
            order="6.0"
        )
    )

