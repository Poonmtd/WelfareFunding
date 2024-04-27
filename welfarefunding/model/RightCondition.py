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
    
    welfareID = IntegerColumn(
        foreignKey="WelfareCondition.id"
    )
    
    # def check(self, member:FundingMember) -> bool:
    #     print('member condition------------------------------------')
    #     if not (isinstance(self, RightCondition) and isinstance(member, FundingMember)):
    #         print("self and member should be objects, not lists")
    #         return False
        
    #     # print(member.birthday)
    #     if not ((self.gender == member.gender) and (self.checkage(member.birthday) >= self.age)  and (self.checkmembership(member.applyDate) >= self.membership)):
    #         print('------------------------------Condition--------------------------------------------------')
    #         return False
    #     print('------------------------------Condition  TRUE--------------------------------------------------')
    #     return True
    def check(self, member:FundingMember) -> bool:
        print('member condition------------------------------------')
        # for memberprint in member:
        #     print('gender:',memberprint.gender)
        
        for memberapply in member:
            gender = memberapply.gender
            age = self.checkage(memberapply.birthday)
            membership = self.checkmembership(memberapply.applyDate)
        
        print('gender:',gender)
        print('age:',age)
        print('membership:',membership)
        # if not (isinstance(member, FundingMember)):
        #     print("self and member should be objects, not lists")
        #     return False
        
        # print(member.birthday)
        if ((self.gender == gender or self.gender is None) and (age >= self.age or self.age is None)  and (membership >= self.membership or self.membership is None)):
            print('------------------------------Condition--------------------------------------------------')
            return True
        return False
    
    def checkage(self, birthday) -> bool:
        today = datetime.now()
        differenceTime = today.year-birthday.year
        print(differenceTime)
        return differenceTime
    
    def checkmembership(self, applyDate) -> bool:
        today = datetime.now()
        differenceTime = today.year-applyDate.year
        return differenceTime
    