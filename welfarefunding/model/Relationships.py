from enum import IntEnum

class Relationships(IntEnum):
    CHILD = 1
    MOTHER = 2
    FATHER = 3
    SIBLING = 4
    GRANDCHILD = 5
    RELATIVE = 6
    HUSBAND = 7
    
Relationships.label = {
    Relationships.CHILD: "บุตร",
    Relationships.MOTHER: "มารดา",
    Relationships.FATHER: "บิดา",
    Relationships.SIBLING: "พี่/น้อง",
    Relationships.GRANDCHILD: "หลาน",
    Relationships.RELATIVE: "ญาติ",
    Relationships.HUSBAND: "สามี/ภรรยา"
}