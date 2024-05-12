from xerial.Record import Record

from xerial.FloatColumn import FloatColumn

from xerial.input.NumberInput import NumberInput
from xerial.IntegerColumn import IntegerColumn
from xerial.StringColumn import StringColumn
from xerial.input.TextInput import TextInput

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
    
    nameWelfare = StringColumn(
        input = TextInput(
            label = "ชื่อกลุ่ม/กองทุน",
            isRequired = False,
            order = "3.0"
        )
    )
    
    addressNumber = StringColumn(
		input=TextInput(
			label="ที่ตั้งเลขที่",
			isRequired=False,
			order="4.0"
		)
	)
    
    moo = IntegerColumn(
		input=NumberInput(
			label="หมู่",
			isRequired=False,
			order="5.0"
		)
	)
    
    alley=StringColumn(
		input=TextInput(
			label="ตรอก/ซอย",
			isRequired=False,
			order="6.0"
		)
	)
    
    road=StringColumn(
		input=TextInput(
			label="ถนน",
			isRequired=False,
			order="7.0"
		)
	)
    
    subDistrictID=StringColumn(
		input=TextInput(
			label="ตำบล/แขวง",
			isRequired=False,
			order="8.0"
		)
	)
    
    districtID=StringColumn(
		input=TextInput(
			label="อำเภอ/เขต",
			isRequired=False,
			order="9.0"
		)
	)
    
    province=StringColumn(
		input=TextInput(
			label="จังหวัด",
			isRequired=False,
			order="10.0"
		)
	)
    
    postalCode=StringColumn(
		input=TextInput(
			label="รหัสไปรษณีย์",
			isRequired=False,
			order="11.0"
		)
	)
    
    telephoneNumber=StringColumn(
		input=TextInput(
			label="หมายเลขโทรศัพท์",
			isRequired=True,
			order="12.0"
		)
    )
    
    faxNumber=StringColumn(
		input=TextInput(
			label="หมายเลขโทรสาร",
			isRequired=True,
			order="13.0"
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
        # modification = self.createmodification("2.3")
        # modification.add("nameWelfare", StringColumn(default=''))
        # modification = self.createmodification("2.4")
        # modification.add("addressNumber",StringColumn(default=''))
        # modification = self.createmodification("2.5")
        # modification.add("moo",IntegerColumn(default=0))
        # modification = self.createmodification("2.6")
        # modification.add("alley",StringColumn(default=''))
        # modification = self.createmodification("2.7")
        # modification.add("road",StringColumn(default=''))
        # modification = self.createmodification("2.8")
        # modification.add("subDistrictID",StringColumn(default=''))
        # modification = self.createmodification("2.9")
        # modification.add("districtID",StringColumn(default=''))
        # modification = self.createmodification("2.10")
        # modification.add("province",StringColumn(default=''))
        # modification = self.createmodification("2.11")
        # modification.add("postalCode",StringColumn(default=''))
        # modification = self.createmodification("2.12")
        # modification.add("telephoneNumber",StringColumn(default=''))
        # modification = self.createmodification("2.13")
        # modification.add("faxNumber",StringColumn(default=''))
        # print(modification.generateQuery())