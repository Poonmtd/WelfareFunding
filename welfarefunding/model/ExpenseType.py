from enum import IntEnum

class ExpenseType(IntEnum):
    BANKDEPOSIT = 1
    CASH = 2
    WELFAREBENEFIT = 3
    COMPENSATION = 4
    TRANSPORTATION = 5
    DOCUMENTANDSTATIONERY = 6
    ACTIVITY = 7
    OTHER = 8


ExpenseType.label = {
    ExpenseType.BANKDEPOSIT: "เงินฝากในธนาคาร",
    ExpenseType.CASH: "เงินสดในมือ",
    ExpenseType.WELFAREBENEFIT: "จ่ายสวัสดิการให้กับสมาชิก",
    ExpenseType.COMPENSATION: "ตอบเเทนคนทำงาน",
    ExpenseType.TRANSPORTATION: "ค่าพาหนะ",
    ExpenseType.DOCUMENTANDSTATIONERY: "ค่าเอกสาร/เครื่องเขียน",
    ExpenseType.ACTIVITY: "ค่ากิจกรรม/ประชุม",
    ExpenseType.OTHER: "อื่นๆ"
}