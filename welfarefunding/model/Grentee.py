from xerial.Record import Record
from xerial.IntegerColumn import IntegerColumn
from xerial.DateColumn import DateColumn
from xerial.StringColumn import StringColumn
from gaimon.model.User import User

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput

# Record.appendGroup(User, 'ผู้รับสิทธิ', 50, '2.0')

class Grentee(Record):

	granteeName = StringColumn(
		input=TextInput(
			label="ชื่อผู้รับสิทธิ์",
			isRequired=True,
			order="1.0"
		)
	)    
 
	granteeSername = StringColumn(
		input=TextInput(
			label="นามสกุลผู้รับสิทธิ์",
			isRequired=True,
			order="2.0"
		)
	)
	
	addressNumber = IntegerColumn(
		input=NumberInput(
			label="บ้านเลขที่",
			isRequired=False,
			order="3.0"
		)
	)
 
	moo = IntegerColumn(
		input=NumberInput(
			label="หมู่",
			isRequired=False,
			order="4.0"
		)
	)
 
	alley=StringColumn(
		input=TextInput(
			label="ตรอก/ซอย",
			isRequired=False,
			order="5.0"
		)
	)
 
	road=StringColumn(
		input=TextInput(
			label="ถนน",
			isRequired=False,
			order="6.0"
		)
	)
	
	subDistrictID=StringColumn(
		input=TextInput(
			label="ตำบล/แขวง",
			isRequired=False,
			order="7.0"
		)
	)
 
	districtID=StringColumn(
		input=TextInput(
			label="อำเภอ/เขต",
			isRequired=False,
			order="8.0"
		)
	)
 
	province=StringColumn(
		input=TextInput(
			label="จังหวัด",
			isRequired=False,
			order="9.0"
		)
	)
 
	postalCode=StringColumn(
		input=TextInput(
			label="รหัสไปรษณีย์",
			isRequired=False,
			order="10.0"
		)
	) 