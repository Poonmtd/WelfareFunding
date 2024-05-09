from enum import IntEnum

class Relationships(IntEnum):
    CHILD = 1
    MOTHER = 2
    FATHER = 3
    SIBLING = 4
    GRANDCHILD = 5
    RELATIVE = 6
    
Relationships.label = {
    Relationships.CHILD: "บุตร",
    Relationships.MOTHER: "แม่",
    Relationships.FATHER: "พ่อ",
    Relationships.SIBLING: "พี่/น้อง",
    Relationships.GRANDCHILD: "หลาน",
    Relationships.RELATIVE: "ญาติ"
}