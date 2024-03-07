from enum import IntEnum

class Status(IntEnum):
    SINGLE = 1
    MARRIED = 2
    DIVORCE = 3
    WIDOEWD = 4
    SEPARATED = 5

Status.label = {
    Status.SINGLE: "โสด",
    Status.MARRIED: "สมรส",
    Status.DIVORCE: "หย่า",
    Status.WIDOEWD: "หม่าย",
    Status.SEPARATED: "แยกกันอยู่"
}