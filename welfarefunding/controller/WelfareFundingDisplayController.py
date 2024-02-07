from enum import IntEnum
from typing import Dict
from gaimon.core.Route import GET, POST
from sanic import response
from gaimon.core.RESTResponse import RESTResponse, SuccessRESTResponse as Success
import pystache

__GAIMON_CSS__ = [
	'FontFamily.css',
	'AlertDialog.css',
	'SlideShow.css',
	'Flex.css',
	'Style.css',
]

__GAIMON_INCOMPRESSIBLE_CSS__ = [
	'FontFamily.css',
]

__BACKEND_JS__ = [
	
]

__EXTENSION_JS__ = {
	'welfarefunding': [
		'frontend/WelfareFunding.js'
	],
}

__EXTENSION_CSS__ = {
	'welfarefunding': [
		'WelfareFunding.css',
		'WelfareFundingtResponsive.css'
	],
}

class AppPlatform (IntEnum) :
	WEB = 1
	NW = 2
	ANDROID = 3
	IOS = 4
	
class WelfareFundingDisplayController :
	def __init__(self, application) :
		from gaimon.core.AsyncApplication import AsyncApplication
		self.application:AsyncApplication = application
		self.extensionLoader = application.extension
		self.title = application.title
		self.fullTitle = application.title
		if hasattr(application, "fullTitle"): self.fullTitle = application.fullTitle
		self.icon = ""
		if hasattr(application, "icon"): self.icon = application.icon
		self.page = application.createPage()
		self.resourcePath = application.resourcePath
		self.renderer = pystache.Renderer()
		self.thailand = {}
		self.RESET_PASSWORD_KEY = "GaimonResetPassword"
		self.platformPage = {}

	@GET("/welfarefunding", role=['guest'])
	async def renderIndex(self, request) :
		result = await self.initPage(AppPlatform.WEB)
		return response.html(result)
	
	def setExternalLogin(self, page) :
		config = self.application.config['authentication']
		isExternal = False
		page.jsVar['authentication'] = config
		page.jsVar['authentication']['isExternal'] = isExternal
		if config['google']['enable'] :
			page.js.append("https://accounts.google.com/gsi/client")
			isExternal = True
		if isExternal :
			page.js.append('protocol/ExternalLoginProtocol.js')

	async def initPage(self, platform: AppPlatform = AppPlatform.WEB, jsVar: Dict = {}):
		if platform in self.platformPage: return self.platformPage[platform]
		applicationPage = self.application.createPage()
		applicationPage.reset()
		applicationPage.title = self.title
		applicationPage.extendJS(__BACKEND_JS__)
		# applicationPage.enableQuill()
		# applicationPage.enableCropper()
		if not 'TITLE' in applicationPage.jsVar: applicationPage.jsVar['TITLE'] = self.title
		if not 'FULL_TITLE' in applicationPage.jsVar: applicationPage.jsVar['FULL_TITLE'] = self.fullTitle
		if not 'LOGO' in applicationPage.jsVar: applicationPage.jsVar['LOGO'] = self.icon
		applicationPage.extensionJS = __EXTENSION_JS__

		applicationPage.extendCSS(__GAIMON_CSS__)
		applicationPage.extendIncompressibleCSS(__GAIMON_INCOMPRESSIBLE_CSS__)
		for extension in __EXTENSION_CSS__ :
			applicationPage.extensionCSS[extension] = __EXTENSION_CSS__[extension]

		applicationPage.jsVar['IS_MOBILE_APP'] = False
		for key in jsVar:
			applicationPage.jsVar[key] = jsVar[key]

		self.setExternalLogin(applicationPage)
		applicationPage.enableGoogleAnalytics(self.application.config.get("googleAnalyticsCode", ""))
		template = self.theme.getTemplate('welfarefunding/WelfareFunding.tpl')
		applicationPage.body = self.renderer.render(template, {'rootURI': applicationPage.rootURL})
		applicationPage.favicon = "share/icon/favicon.png"
		if platform == AppPlatform.WEB: 
			self.platformPage[platform] = applicationPage.render(ID="WelfareFunding.WEB")
			return self.platformPage[platform]
		if platform == AppPlatform.NW: applicationPage.js.append('utils/Utils_NW.js')
		elif platform == AppPlatform.ANDROID: applicationPage.js.append('utils/Utils_Android.js')
		elif platform == AppPlatform.IOS: applicationPage.js.append('utils/Utils_IOS.js')
		applicationPage.jsVar['IS_MOBILE_APP'] = True
		page = applicationPage.render(ID=f"WelfareFunding.{platform.name}")
		result = {}
		keyJS = f'src="{self.page.rootURL}'
		replaceKeyJS = 'src="./'
		page = page.replace(keyJS, replaceKeyJS)
		keyCSS = f'href="{self.page.rootURL}'
		replaceKeyCSS = 'href="./'
		page = page.replace(keyCSS, replaceKeyCSS)
		jsList = []
		for js in self.page.js:
			jsList.append(f'share/js/{js}')
		for extension in __EXTENSION_JS__:
			for js in __EXTENSION_JS__[extension]:
				jsList.append(f'share/{extension}/js/{js}')
		cssList = []
		for css in self.page.css:
			cssList.append(f'share/css/{css}')
		for extension in self.application.extension.css:
			for css in self.application.extension.css[extension]:
				cssList.append(f'share/{extension}/css/{css}')
		result['page'] = page
		result['js'] = jsList
		result['css'] = cssList
		result['view'] = {}
		self.platformPage[platform] = result
		return result