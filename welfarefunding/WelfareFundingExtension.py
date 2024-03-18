from gaimon.core.Extension import Extension, InputExtension

from typing import Dict

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.Gender import Gender
from welfarefunding.model.Status import Status
from welfarefunding.model.VulnerableGroup import VulnerableGroup
from gaimon.model.User import UserInputGroup

class WelfareFundingExtension(Extension):
    def __init__(self, resourcePath: str, configPath: str):
        self.ID = "welfarefunding"
        self.name = "WelfareFunding"
        self.path = self.getPath(__file__)
        super().__init__(resourcePath, configPath)

    # NOTE This method will be called by initialize module for first time.
    async def initialize(
        self, isCopy: bool = True, isForce: bool = False, isSetLocalConfig: bool = True
    ):
        await super().initialize(isCopy, isForce)

    # NOTE This method will be called by start Gaimon server.
    async def load(self, application):
        from gaimon.core.AsyncApplication import AsyncApplication

        self.application: AsyncApplication = application
        await super().load(application)

    async def getInputExtension(self, modelMap: Dict[str, type]) -> InputExtension:
        extensionConfig = await self.application.configHandler.getExtensionConfig(
            "gaimonerp.orgstruct"
        )
        self.isInputExtended = extensionConfig.get("isInputExtended", True)
        if not self.isInputExtended:
            return {}
        return {
            "User": [
                TextInput(
                    label="เลขบัตรประชาชน (13 หลัก)",
                    order="2.1",
                    columnName="citizenID",
                    isTable=True,
                    isRequired=True,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="หมายเลขโทรศัพท์",
                    columnName="telephoneNumber",
                    isTable=True,
                    isRequired=True,
                    # inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                DateInput(
                    label="วัน/เดือน/ปีเกิด",
                    columnName="birthday",
                    isTable=True,
                    isRequired=True,
                    # inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                DateInput(
                    label="วัน/เดือน/ปี ที่สมัคร",
                    columnName="applyDate",
                    isTable=True,
                    isRequired=True,
                    # inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                DateInput(
                  label="วัน/เดือน/ปี ที่เสียชีวิต",
                  columnName="dateDeath",
                  isTable=True,
                  isRequired=False,
                  group=50
                      ),
                DateInput(
                  label="วัน/เดือน/ปี ที่ลาออก",
                  columnName="resignDate",
                  isTable=True,
                  isRequired=False,
                  group=50
                      ),    
                EnumSelectInput(
                    label="เพศ",
                    columnName="gender",
                    isTable=True,
                    isRequired=True,
                    enum=Gender,
                    group=50,
                ),
                EnumSelectInput(
                    label="สถานภาพทางการสมรส",
                    columnName="maritalStatus",
                    isTable=True,
                    isRequired=True,
                    enum=Status,
                    group=50,
                ),
                EnumSelectInput(
                    label="กลุ่มเปราะบาง",
                    columnName="VulnerableGroup",
                    isTable=True,
                    isRequired=False,
                    enum=VulnerableGroup,
                    group=50,
                ),
                NumberInput(
                    label="บ้านเลขที่",
                    columnName="addressNumber",
                    isTable=True,
                    isRequired=False,
                    group=50
                ),
                NumberInput(
                    label="หมู่",
                    columnName="moo",
                    isTable=True,
                    isRequired=False,
                    group=50    
                ),
                TextInput(
                    label="ตรอก/ซอย",
                    columnName="alley",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="ถนน",
                    columnName="road",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="ตำบล/แขวง",
                    columnName="subDistrictID",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="อำเภอ/เขต",
                    columnName="districtID",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="จังหวัด",
                    columnName="province",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="รหัสไปรษณีย์",
                    columnName="postalCode",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="ผู้รับสิทธิ์คนที่ 1",
                    columnName="grantee_one",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
                TextInput(
                    label="ผู้รับสิทธิ์คนที่ 2",
                    columnName="grantee_two",
                    isTable=True,
                    isRequired=False,
                    group=50,
                ),
            ]
        }


# test
# จัดบรรทัดใช้  inputPerLine=4 เล็กสุดได้ 4ช่อง ต่อเเถว 
