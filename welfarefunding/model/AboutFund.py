from xerial.Record import Record

from xerial.FloatColumn import FloatColumn

from xerial.input.NumberInput import NumberInput
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.input.DateInput import DateInput

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
    
    applyDate = DateColumn(
        input=DateInput(
            label='วันที่บันทึก',
            isRequired=True,
            order='2.2'
        )
    )
    
    isDrop = IntegerColumn(
        default=0
	)
    
    def modify(self):
        modification = self.createModification("2.1")
        modification.add("isDrop", IntegerColumn(default=0))
        modification = self.createModification("2.2")
        modification.add("applyDate", DateColumn(''))

