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
from welfarefunding.model.Nametitle import Nametitle

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
                    label="เลขที่สมาชิก",
                    order="0",
                    columnName="memberNumber",
                    isTable=True,
                    isRequired=True,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="เลขบัตรประชาชน (13 หลัก)",
                    order="4.1",
                    columnName="citizenID",
                    isTable=True,
                    isRequired=True,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="หมายเลขโทรศัพท์",
                    order="4.11",
                    columnName="telephoneNumber",
                    isTable=False,
                    isRequired=True,
                    # inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                DateInput(
                    label="วัน/เดือน/ปีเกิด",
                    order="4.2",
                    columnName="birthday",
                    # isTable=True,
                    isRequired=True,
                    # inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                DateInput(
                    label="วัน/เดือน/ปี ที่สมัคร",
                    order="8.1",
                    columnName="applyDate",
                    # isTable=True,
                    isRequired=True,
                    # inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                DateInput(
                  label="วัน/เดือน/ปี ที่เสียชีวิต",
                  order="8.3",
                  columnName="dateDeath",
                #   isTable=True,
                  isRequired=False,
                  group=UserInputGroup.GENERIC
                ),
                DateInput(
                  label="วัน/เดือน/ปี ที่ลาออก",
                  order="8.2",
                  columnName="resignDate",
                #   isTable=True,
                  isRequired=False,
                  group=UserInputGroup.GENERIC
                ),    
                EnumSelectInput(
                    label="เพศ",
                    order="4.2.1",
                    columnName="gender",
                    # isTable=True,
                    isRequired=True,
                    enum=Gender,
                    inputPerLine=3,
                    group=UserInputGroup.GENERIC,
                ),
                EnumSelectInput(
                    label="คำนำหน้า",
                    order="2.1",
                    columnName="Nametitle",
                    isTable=True,
                    isRequired=True,
                    enum=Nametitle,
                    group=UserInputGroup.GENERIC
                ),
                EnumSelectInput(
                    label="สถานภาพทางการสมรส",
                    order="4.2.2",
                    columnName="maritalStatus",
                    # isTable=True,
                    isRequired=True,
                    enum=Status,
                    inputPerLine=3,
                    group=UserInputGroup.GENERIC
                ),
                EnumSelectInput(
                    label="กลุ่มพิเศษ",
                    order="4.2.3",
                    columnName="VulnerableGroup",
                    # isTable=True,
                    isRequired=False,
                    enum=VulnerableGroup,
                    inputPerLine=3,
                    group=UserInputGroup.GENERIC
                ),
                NumberInput(
                    label="บ้านเลขที่",
                    order="4.3",
                    columnName="addressNumber",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                NumberInput(
                    label="หมู่",
                    order="4.4",
                    columnName="moo",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC  
                ),
                TextInput(
                    label="ตรอก/ซอย",
                    order="4.5",
                    columnName="alley",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="ถนน",
                    order="4.6",
                    columnName="road",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="ตำบล/แขวง",
                    order="4.7",
                    columnName="subDistrictID",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="อำเภอ/เขต",
                    order="4.8",
                    columnName="districtID",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="จังหวัด",
                    order="4.9",
                    columnName="province",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                TextInput(
                    label="รหัสไปรษณีย์",
                    order="4.10",
                    columnName="postalCode",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=4,
                    group=UserInputGroup.GENERIC
                ),
                
                TextInput(
                    label="ผู้รับสิทธิ์คนที่ 1",
                    columnName="grantee_one",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=1,
                    group=50,
                ),NumberInput(
                    label="บ้านเลขที่",
                    columnName="addressNumberG1",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                NumberInput(
                    label="หมู่",
                    columnName="mooG1",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50 
                ),
                TextInput(
                    label="ตรอก/ซอย",
                    columnName="alleyG1",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="ถนน",
                    columnName="roadG1",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="ตำบล/แขวง",
                    columnName="subDistrictIDG1",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="อำเภอ/เขต",
                    columnName="districtIDG1",
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="จังหวัด",
                    columnName="provinceG1",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="รหัสไปรษณีย์",
                    columnName="postalCodeG1",
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="ผู้รับสิทธิ์คนที่ 2",
                    columnName="grantee_two",
                    # isTable=True,
                    isRequired=True,
                    inputPerLine=1,
                    group=50,
                ),NumberInput(
                    label="บ้านเลขที่",
                    columnName="addressNumberG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                NumberInput(
                    label="หมู่",
                    columnName="mooG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="ตรอก/ซอย",
                    columnName="alleyG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="ถนน",
                    columnName="roadG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="ตำบล/แขวง",
                    columnName="subDistrictIDG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="อำเภอ/เขต",
                    columnName="districtIDG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="จังหวัด",
                    columnName="provinceG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
                TextInput(
                    label="รหัสไปรษณีย์",
                    columnName="postalCodeG2",
                    # isTable=True,
                    isRequired=False,
                    inputPerLine=4,
                    group=50
                ),
            ]
        }


# test
# จัดบรรทัดใช้  inputPerLine=4 เล็กสุดได้ 4ช่อง ต่อเเถว 
