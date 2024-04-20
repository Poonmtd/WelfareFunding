from enum import IntEnum

class BudgetType(IntEnum):
    CODI = 100
    GOVERNMENTCONTRIBUTION = 200
    LOCALGOVERNMENT = 300
    OTHERGOVERNMENT = 400


BudgetType.label = {
    BudgetType.CODI: "สถาบันพัฒนาองค์กรชุมชน (พอช.)",
    BudgetType.GOVERNMENTCONTRIBUTION: "สถาบันพัฒนาองค์กรชุมชน (พอช.) (งบสมทบจากรัฐบาลผ่าน พอช.)",
    BudgetType.LOCALGOVERNMENT: "องค์กรปกครองส่วนท้องถิ่น (อบต./เทศบาล/อบจ.)",
    BudgetType.OTHERGOVERNMENT: "หน่วยงานภาครัฐอื่นๆ (ที่นอกเหนือจากการสมทบจาก พอช.)"
}