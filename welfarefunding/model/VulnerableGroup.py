from enum import IntEnum

class VulnerableGroup(IntEnum):
    ORPHANED = 1
    UNDERPRIVILEGED = 2
    DISABLED = 3

VulnerableGroup.label = {
    VulnerableGroup.ORPHANED: "กำพร้า",
    VulnerableGroup.UNDERPRIVILEGED: "ด้อยโอกาส",
    VulnerableGroup.DISABLED: "พิการ"
}