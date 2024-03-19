from xerial.Record import Record

from xerial.IntegerColumn import IntegerColumn
from xerial.input.ReferenceSelectInput import ReferenceSelectInput
from xerial.input.ReferenceCheckBoxInput import ReferenceCheckBoxInput
from xerial.input.AutoCompleteInput import AutoCompleteInput

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
        foreignKey="WelfareType.id",
        input=ReferenceSelectInput(
            label="ประเภทสวัสดิการ",
            url="welfarefunding/welfaretype/option/get",
            order="2.0",
            isRequired=True,
            isTable=True,
            isSearch=True
        )
    )



    # welfareCondition = IntegerColumn(
    #     foreignKey="WelfareCondition.id",
    #     input=ReferenceCheckBoxInput(
    #         label="เงื่อนไขการรับสวัสดิการ",
    #         order="2.0",
    #         url="welfarefunding/welfarecondition/option/get",
    #         isRequired=True
    #     )
    # )