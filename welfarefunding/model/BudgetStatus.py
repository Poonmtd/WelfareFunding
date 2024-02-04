from enum import IntEnum

class BudgetStatus(IntEnum):
    ONPROCESS = 1
    CANCEL = 2
    SUCCESS = 3
    DRAFT = 4


BudgetStatus.label = {
    BudgetStatus.ONPROCESS.value: "อยู่ระหว่างดำเนินงาน",
    BudgetStatus.CANCEL.value: "ยกเลิก",
    BudgetStatus.SUCCESS.value: "สำเร็จ",
    BudgetStatus.DRAFT.value: "แบบร่าง"
}

BudgetStatus.color = {
    BudgetStatus.ONPROCESS.value: "YELLOW",
    BudgetStatus.CANCEL.value: "RED",
    BudgetStatus.SUCCESS.value: "GREEN",
    BudgetStatus.DRAFT.value: "GRAY"
}