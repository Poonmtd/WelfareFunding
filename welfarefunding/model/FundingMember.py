from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.Gender import Gender
from welfarefunding.model.Status import Status
from welfarefunding.model.VulnerableGroup import VulnerableGroup

Record.appendGroup(User, 'Member', 50, '2.0')

class FundingMember(Record):
	uid = IntegerColumn(foreignKey="User.id")
 
	citizenID = StringColumn(
		default='',
		length=20,
		input=NumberInput(
			label="เลขบัตรประชาชน (13 หลัก)",
			isTable=True,
			isRequired=True,
			order="1.0"
		)
	)

	telephoneNumber = IntegerColumn(
		length=20,
		input=NumberInput(
			label="หมายเลขโทรศัพท์",
			isRequired=True,
			order="1.1"
		)
	)

	birthday = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปีเกิด",
			isRequired=True,
			order="2.0"
		)
	)

	applyDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปีสมัคร",
			isRequired=True,
			order="3.0"
		)
	)
 
	dateDeath = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปี เสียชีวิต",
			isRequired=False,
			order="3.1"
		)
	)
 
	resignDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปี ลาออก",
			isRequired=False,
			order="3.2"
		)
	)

	gender = IntegerColumn(
		input=EnumSelectInput(
			label="เพศ",
			isRequired=True,
			enum=Gender,
			order="4.0"
		)
	)

	maritalStatus = IntegerColumn(
		input=EnumSelectInput(
			label="สถานภาพทางการสมรส",
			isRequired=True,
			enum=Status,
			order="5.0"
		)
	)
 
	VulnerableGroup = IntegerColumn(
		input=EnumSelectInput(
			label="กลุ่มเปราะบาง",
			isRequired=False,
			enum=VulnerableGroup,
			order="5.1"
		)
	)
 
	addressNumber = IntegerColumn(
		input=NumberInput(
			label="บ้านเลขที่",
			isRequired=False,
			order="5.2"
		)
	)
 
	moo = IntegerColumn(
		input=NumberInput(
			label="หมู่",
			isRequired=False,
			order="5.3"
		)
	)
 
	alley=StringColumn(
		input=TextInput(
			label="ตรอก/ซอย",
			isRequired=False,
			order="5.4"
		)
	)
 
	road=StringColumn(
		input=TextInput(
			label="ถนน",
			isRequired=False,
			order="5.5"
		)
	)
	
	subDistrictID=StringColumn(
		input=TextInput(
			label="ตำบล/แขวง",
			isRequired=False,
			order="5.6"
		)
	)
 
	districtID=StringColumn(
		input=TextInput(
			label="อำเภอ/เขต",
			isRequired=False,
			order="5.7"
		)
	)
 
	province=StringColumn(
		input=TextInput(
			label="จังหวัด",
			isRequired=False,
			order="5.8"
		)
	)
 
	postalCode=StringColumn(
		input=TextInput(
			label="รหัสไปรษณีย์",
			isRequired=False,
			order="5.9"
		)
	)

	grantee_one = StringColumn(
		input=TextInput(
			label="ผู้รับสิทธิ์คนที่ 1",
			isRequired=True,
			order="6.0"
		)
	)

	grantee_two = StringColumn(
		input=TextInput(
			label="ผู้รับสิทธิ์คนที่ 2",
			isRequired=True,
			order="7.0"
		)
	)

	path = StringColumn(default='', length=-1)
 
	# test

	isDrop = IntegerColumn(
		default=0
	)

	def modify(self):
		modification = self.createModification("2.0")
		modification.add("isDrop", IntegerColumn(default=0))
		modification = self.createModification('2.1')
		modification.add("citizenID", StringColumn(default='', length=20))
		modification = self.createModification('2.2')
		modification.add("path", StringColumn(default='', length=-1))