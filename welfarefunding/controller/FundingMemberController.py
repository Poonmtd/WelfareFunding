from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
	RESTResponse as REST,
	ErrorRESTResponse as Error,
	SuccessRESTResponse as Success
)
from gaimon.core.StaticFileHandler import StaticFileHandler
from welfarefunding.model.FundingMember import FundingMember

import os, string, random, mimetypes, base64

from weasyprint import HTML

from sanic import response

@BASE(FundingMember, "/welfarefunding/fundingmemmber", "welfarefunding.FundingMember")
class FundingMemberController(BaseController):
	def __init__(self, application):
		super().__init__(application)
		self.static: StaticFileHandler = self.application.static

	@GET('/welfarefunding/documentmember/by/id/get/<id>', role=['user'])
	async def getDocumentMember(self, request, id):
		model = await self.session.select(FundingMember, 'WHERE uid = ?', parameter=[int(id)], isRelated=True)
		if len(model) == 0: return Error('Member does not exist.')
		model = model[0]
		data = model.toDict()
		# if len(model.path): return await response.file(f"{self.resourcePath}upload/{model.path}")
		if len(model.path):
			await self.static.removeStaticShare(model.path) # remove old file before generate new file
		path = await self.generateDocumentMemberPDF(data)
		model.path = path
		await self.session.update(model)
		path = f"{self.resourcePath}upload/{path}"
		return await response.file(path)

	async def generateDocumentMemberPDF(self, data):
		print(data)
		font = await self.getFont()
		template = self.theme.getTemplate('welfarefunding/DocumentMember.tpl')
		data['font'] = font
		html = self.renderer.render(template, data)
		letters = string.ascii_lowercase
		fileName = ''.join(random.choice(letters) for i in range(20))
		path = self.resourcePath + "upload/welfarefunding/document"
		os.makedirs(path, exist_ok=True)
		pathFile = path + "/%s.pdf" % (fileName)
		html = HTML(string=html)
		html.write_pdf(pathFile)
		pathUpload = "welfarefunding/document/%s.pdf" % (fileName)
		print('--------------- GENERATE PDF FINISHED ---------------')
		return pathUpload
	
	async def getFont(self):
		font = self.theme.getTemplate('welfarefunding/FontFamily.tpl')
		font = self.renderer.render(font, {})
		return font