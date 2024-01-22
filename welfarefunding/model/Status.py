from enum import IntEnum

class Status(IntEnum):
    MARRIED = 1
    DIVORCE = 2
    WIDOEWD = 3
    ORPHANED = 4
    UNDERPRIVILEGED = 5
    DISABLED = 6

Status.label = {
    Status.MARRIED: "สมรส",
    Status.DIVORCE: "หย่า",
    Status.WIDOEWD: "หม่าย",
    Status.ORPHANED: "กำพร้า",
    Status.UNDERPRIVILEGED: "ด้อยโอกาส",
    Status.DISABLED: "พิการ"
}