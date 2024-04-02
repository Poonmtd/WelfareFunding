from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.NumberInput import NumberInput

from datetime import datetime
from welfarefunding.model.Gender import Gender
from welfarefunding.model.FundingMember import FundingMember


class RightCondition(Record):
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
    
    def chckek(self, member:FundingMember) -> bool:
        if not (self.gender == member.gender) or (self.checkage(member.birthday) >= self.age)  or (self.checkmembership(member.applyDate) >= self.membership):
            return True
        else : return False
    
    def checkage(self, member:FundingMember) -> bool:
        birthday = member.birthday
        today = datetime.now()
        differenceTime = today.year-birthday.year
        return differenceTime
    
    def checkmembership(self, member:FundingMember) -> bool:
        applyday = member.applyDate
        today = datetime.now()
        differenceTime = today.year-applyday.year
        return differenceTime