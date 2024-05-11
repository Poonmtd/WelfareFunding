from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.IncomeItem import IncomeItem
from typing import List, Dict
from welfarefunding.model.SavingFund import SavingFund
from welfarefunding.model.BudgetFund import BudgetFund
from welfarefunding.model.FundingMember import FundingMember

from sanic import response
import os, string, random
from weasyprint import HTML

@BASE(IncomeItem, "/welfarefunding/incomeitem", "welfarefunding.IncomeItem")
class IncomeItemController(BaseController):
    def __init__(self, application):
        super().__init__(application)
         
    @GET('/welfarefunding/documentincome/by/id/get/<id>', role=['user'])
    async def getDocumentIncome(self, request, id):
        model = await self.session.select(IncomeItem, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        modelRole = await self.session.select(FundingMember, 'WHERE isDrop = ? and role = ?', parameter=[0, 'เหรัญญิก'], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        dataRole = modelRole.role
        data['dataRole'] = dataRole
        print(dataRole)
        path = await self.generateDocumentIncomePDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentIncomePDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/DocumentIncome.tpl')
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
