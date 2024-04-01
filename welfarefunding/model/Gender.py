from enum import IntEnum

class Gender(IntEnum):
    MALE = 1
    FEMALE = 2


Gender.label = {
    Gender.MALE: "ชาย",
    Gender.FEMALE: "หญิง"
}