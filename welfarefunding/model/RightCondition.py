from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.NumberInput import NumberInput

from welfarefunding.model.Gender import Gender


class RightCondition(Record):
    welfareid = IntegerColumn(foreignKey="welfarecondition.id")

    gender = IntegerColumn(
		input=EnumSelectInput(
			label="เงื่อนไขเพศ",
			enum=Gender,
			order="1.0"
		)
	)

    age = IntegerColumn(
        input=NumberInput(
            label="เงื่อนไขอายุ",
            order="2.0"
        )
    )

    membership = IntegerColumn(
        input=NumberInput(
            label="เงื่อนไขการเป็นสมาชิก",
            order="3.0"
        )
    )
    
    

    