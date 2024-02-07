from xerial.Record import Record

from xerial.IntegerColumn import IntegerColumn
from xerial.input.ReferenceSelectInput import ReferenceSelectInput
from xerial.input.ReferenceCheckBoxInput import ReferenceCheckBoxInput

class WelfareAppliance(Record):
    welfareType = IntegerColumn(
        default=-1,
        foreignKey="WelfareType.id",
        input=ReferenceSelectInput(
            label="ประเภทสวัสดิการ",
            url="welfarefunding/welfaretype/option/get",
            order="1.0",
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