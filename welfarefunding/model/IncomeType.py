from enum import IntEnum

class IncomeType(IntEnum):
    SAVING = 1
    CODI = 2
    GOVERMENTCONTRIBUTION = 3
    LOCALGOVERMENT = 4
    OTHERGOVERMENT = 5
    FEE = 6
    DONATION = 7
    BANKINTEREST = 8

IncomeType.label = {
    IncomeType.SAVING: "เงินสมทบจากสมาชิก",
    IncomeType.CODI: "สถาบันพัฒนาองค์กรชุมชน(พอช.)",
    IncomeType.GOVERMENTCONTRIBUTION: "งบสมทบจากรัฐบาลผ่าน พอช.",
    IncomeType.LOCALGOVERMENT: "องค์กรปกครองส่วนท้องถิ่น(อบต./เทศบาล/อบจ.)",
    IncomeType.OTHERGOVERMENT: "หน่วยงานภาครัฐอื่นๆ",
    IncomeType.FEE: "ค่าธรรมเนียมเเรกเข้า",
    IncomeType.DONATION: "เงินบริจาค",
    IncomeType.BANKINTEREST: "ดอกเบี้ยธนาคาร"
}