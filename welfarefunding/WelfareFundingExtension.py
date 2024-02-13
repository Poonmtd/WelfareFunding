from gaimon.core.Extension import Extension, InputExtension

from typing import Dict

from xerial.input.NumberInput import NumberInput

class WelfareFundingExtension (Extension) :
	def __init__(self, resourcePath:str, configPath:str):
		self.ID = "welfarefunding"
		self.name = "WelfareFunding"
		self.path = self.getPath(__file__)
		super().__init__(resourcePath, configPath)

	# NOTE This method will be called by initialize module for first time.
	async def initialize(self, isCopy:bool=True, isForce:bool=False, isSetLocalConfig:bool=True) :
		await super().initialize(isCopy, isForce)
	
	# NOTE This method will be called by start Gaimon server.
	async def load(self, application) :
		from gaimon.core.AsyncApplication import AsyncApplication
		self.application: AsyncApplication = application
		await super().load(application)

	async def getInputExtension(self, modelMap: Dict[str, type]) -> InputExtension :
		extensionConfig = await self.application.configHandler.getExtensionConfig('gaimonerp.orgstruct')
		self.isInputExtended = extensionConfig.get('isInputExtended', True)
		if not self.isInputExtended : return {}
		return {
			'User': [
				NumberInput(
					label="เลขบัตรประชาชน (13 หลัก)",
					columnName="citizenID",
					isTable=True,
					isRequired=True,
					group=50
				)
			]
		}