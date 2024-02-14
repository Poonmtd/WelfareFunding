from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput
from xerial.input.ReferenceSelectInput import ReferenceSelectInput

from welfarefunding.model.Gender import Gender
from welfarefunding.model.Status import Status
# Record.appendGroup(User, 'Member', 50, '2.0')

class FundCommittee(Record):
    uid = IntegerColumn(foreignKey="User.id")
    
    positionName = IntegerColumn(
        default=-1,
        foreignKey="Position.id",
        input=ReferenceSelectInput(
            label="ตำแหน่งในชุมชน",
            url="welfarefunding/position/option/get",
            isRequired=True,
            isTable=True,
            isSearch=True,
            order="1.0"
        )
    )
    
    communityPositionName = StringColumn(
		input=TextInput(
			label="ตำแหน่งในชุมชน",
			isRequired=True,
			order="2.0"
		)
	)