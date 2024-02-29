from gaimon.core.Extension import Extension, InputExtension

from typing import Dict

from xerial.input.NumberInput import NumberInput
from xerial.input.DateInput import DateInput
from xerial.input.EnumSelectInput import EnumSelectInput
from xerial.input.TextInput import TextInput

from welfarefunding.model.Gender import Gender
from welfarefunding.model.Status import Status


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
                NumberInput(
                    label="เลขบัตรประชาชน (13 หลัก)",
                    columnName="citizenID",
                    isTable=True,
                    isRequired=True,
                    group=50,
                ),
                NumberInput(
                    label="หมายเลขโทรศัพท์",
                    columnName="telephoneNumber",
                    isTable=True,
                    isRequired=True,
                    group=50,
                ),
                DateInput(
                    label="วัน/เดือน/ปีเกิด",
                    columnName="birthday",
                    isTable=True,
                    isRequired=True,
                    group=50,
                ),
                DateInput(
                    label="วัน/เดือน/ปี ที่สมัคร",
                    columnName="applyDate",
                    isTable=True,
                    isRequired=True,
                    group=50,
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
                    label="สถานภาพ",
                    columnName="maritalStatus",
                    isTable=True,
                    isRequired=True,
                    enum=Status,
                    group=50,
                ),
                TextInput(
                    label="ผู้รับสิทธิ์คนที่ 1",
                    columnName="grantee_one",
                    isTable=True,
                    isRequired=True,
                    group=50,
                ),
                TextInput(
                    label="ผู้รับสิทธิ์คนที่ 2",
                    columnName="grantee_two",
                    isTable=True,
                    isRequired=True,
                    group=50,
                ),
            ]
        }


#   test
