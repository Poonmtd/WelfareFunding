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
    
    def check(self, member:FundingMember) -> bool:
        print('member condition------------------------------------')
        print('-----------',member,'----------------')
        for memberapply in member:
            gender = memberapply.gender
            print('gender',gender)
            age = self.checkage(memberapply.birthday)
            print('age',age)
            membership = self.checkmembership(memberapply.applyDate)
            print('membership',membership)
        
        print("selfGender : ",self.gender)
        print("selfAge",self.age)
        print("selfMembership",self.membership)
        # print(member.birthday)
        # if ((self.gender == gender) and (age >= self.age)  
        #     and (membership >= self.membership)):
        if not (self.gender == gender):
            # print('------------------------------Condition--------------------------------------------------')
            print('right false gender')
            return False
        elif not (age >= self.age):
            print('right false age')
            return False
        elif not (membership >= self.membership):
            print('right false membership')
            return False
        print('Right True')
        return True
    # def check(self, member:FundingMember) -> bool:
    #     if not ((self.gender == member.gender) and (self.checkage(member.birthday) >= self.age)  
    #             and (self.checkmembership(member.applyDate) >= self.membership)):
    #         return False
    #     return True
    
    def checkage(self, birthday) -> bool:
        today = datetime.now()
        birthdayyear = birthday.year
        if birthday.year > today.year:
            birthdayyear = birthday.year - 543
        # differenceTime = today.year-birthday.year
        differenceTime = today.year-birthdayyear
        print(differenceTime)
        return differenceTime
    
    def checkmembership(self, applyDate) -> bool:
        today = datetime.now()
        applyyear = applyDate.year
        if applyDate.year > today.year:
            applyyear = applyDate.year - 543
        differenceTime = today.year-applyyear
        return differenceTime
    