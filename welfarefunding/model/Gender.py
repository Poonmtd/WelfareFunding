from enum import IntEnum

class Gender(IntEnum):
    MALE = 0
    FEMALE = 1


Gender.label = {
    Gender.MALE: "ชาย",
    Gender.FEMALE: "หญิง"
}