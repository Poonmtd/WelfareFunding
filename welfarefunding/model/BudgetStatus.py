from enum import IntEnum

class BudgetStatus(IntEnum):
    ONPROCESS = 1
    CANCEL = 2
    SUCCESS = 3


BudgetStatus.label = {
    BudgetStatus.ONPROCESS: "อยู่ระหว่างดำเนินงาน",
    BudgetStatus.CANCEL: "ยกเลิก",
    BudgetStatus.SUCCESS: "สำเร็จ"
}