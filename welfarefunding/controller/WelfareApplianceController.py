from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.WelfareAppliance import WelfareAppliance
from welfarefunding.model.WelfareCondition import WelfareCondition

from sanic import response
import os, string, random
from weasyprint import HTML

@BASE(WelfareAppliance, "/welfarefunding/welfareappliance", "welfarefunding.WelfareAppliance")
class WelfareApplianceController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET('/welfarefunding/documentappliance/by/id/get/<id>', role=['user'])
    async def getDocumentAppliance(self, request, id):
        model = await self.session.select(WelfareAppliance, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        path = await self.generateDocumentAppliancePDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentAppliancePDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/DocumentAppliance.tpl')
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