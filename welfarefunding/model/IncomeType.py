from enum import IntEnum

class IncomeType(IntEnum):
    MEMBERSCONTRIBUTION = 1
    CODI = 2
    GOVERNMENTCONTRIBUTION = 3
    LOCALGOVERNMENT = 4
    OTHERGOVERNMENT = 5
    FEE = 6
    DONATION = 7
    BANKINTEREST = 8


IncomeType.label = {
    IncomeType.MEMBERSCONTRIBUTION: "เงินสมทบจากสมาชิก",
    IncomeType.CODI: "สถาบันพัฒนาองค์กรชุมชน (พอช.) (55,000/100,000 บาท)",
    IncomeType.GOVERNMENTCONTRIBUTION: "สถาบันพัฒนาองค์กรชุมชน (พอช.) (งบสมทบจากรัฐบาลผ่าน พอช.)",
    IncomeType.LOCALGOVERNMENT: "องค์กรปกครองส่วนท้องถิ่น (อบต./เทศบาล/อบจ.)",
    IncomeType.OTHERGOVERNMENT: "หน่วยงานภาครัฐอื่นๆ (ที่นอกเหนือจากการสมทบผ่าน พอช.)",
    IncomeType.FEE: "ค่าธรรมเนียมแรกเข้า/ค่าสมัคร",
    IncomeType.DONATION: "เงินบริจาค",
    IncomeType.BANKINTEREST: "ดอกเบี้ยธนาคาร"
}