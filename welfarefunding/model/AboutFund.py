from xerial.Record import Record

from xerial.FloatColumn import FloatColumn

from xerial.input.NumberInput import NumberInput

class AboutFund(Record):
    bankBalance = FloatColumn(
        input=NumberInput(
            label="เงินเก็บในธนาคาร",
            isRequired=False,
            order='1.0'
        )
    )

    cash = FloatColumn(
        input=NumberInput(
            label='เงินสด',
            isRequired=False,
            order='2.0'
        )
    )

