from enum import IntEnum

class Nametitle(IntEnum):
    MR	 = 0
    MRS  = 1
    MISS = 2
    BOY = 3
    GIRL = 4
    MONK = 5
    
Nametitle.label = {
    Nametitle.MR : "นาย",
    Nametitle.MRS : "นาง",
    Nametitle.MISS : "นม",
    Nametitle.BOY : "เด็กชาย",
    Nametitle.GIRL : "เด็กหญิง",
    Nametitle.MISS : "พระ"
}