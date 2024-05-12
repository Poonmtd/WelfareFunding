from xerial.Record import Record

from xerial.IntegerColumn import IntegerColumn
from xerial.input.ReferenceSelectInput import ReferenceSelectInput
from xerial.input.ReferenceCheckBoxInput import ReferenceCheckBoxInput
from xerial.input.AutoCompleteInput import AutoCompleteInput
from xerial.input.NumberInput import NumberInput
from xerial.DateColumn import DateColumn
from xerial.input.DateInput import DateInput

class WelfareAppliance(Record):
    member = IntegerColumn(
            default=-1,
            foreignKey='User.id',
            input=AutoCompleteInput(
                label='สมาชิก',
                order='1.0',
                url='user/autoComplete/get',
                template='{{{firstName}}} {{{lastName}}}',
                tableURL='user/option/getByIDList',
                isTable=True,
                isSearch=True,
                isRequired=True
            )
        )

    welfareType = IntegerColumn(
        default=-1,
        foreignKey="WelfareCondition.id",
        input=ReferenceSelectInput(
            label="ประเภทสวัสดิการ",
            url="welfarefunding/welfarecondition/option/get",
            tableURL="welfarefunding/welfarecondition/option/getByIDList",
            order="2.0",
            isRequired=True,
            isTable=True,
            isSearch=True
        )
    )
    
    Amount = IntegerColumn(
        length=20,
        input=NumberInput(
            label="จำนวนเงิน",
            isRequired=True,
            order="3.0",
            isTable=True
        )
    )
    
    ApplianceDate = DateColumn(
		input=DateInput(
			label="วัน/เดือน/ปี ที่ทำการเบิกสวัสดิการ",
			isRequired=True,
			order="3.1"
		)
	)
    
    isDrop = IntegerColumn(
        default=0
	)
    
    def modify(self):
        modification = self.createModification("2.1")
        modification.add("isDrop", IntegerColumn(default=0))
        modification = self.createModification("2.2")
        modification.add("ApplianceDate", DateColumn(default=''))

    # welfareCondition = IntegerColumn(
    #     foreignKey="WelfareCondition.id",
    #     input=ReferenceCheckBoxInput(
    #         label="เงื่อนไขการรับสวัสดิการ",
    #         order="2.0",
    #         url="welfarefunding/welfarecondition/option/get",
    #         isRequired=True
    #     )
    # )