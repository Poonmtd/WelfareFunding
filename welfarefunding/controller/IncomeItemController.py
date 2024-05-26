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

from gaimon.model.UserGroup import UserGroup
from gaimon.model.User import User


from sanic import response
import os, string, random
from weasyprint import HTML

@BASE(IncomeItem, "/welfarefunding/incomeitem", "welfarefunding.IncomeItem")
class IncomeItemController(BaseController):
    def __init__(self, application):
        super().__init__(application)
         
    @GET('/welfarefunding/documentincome/by/id/get/<id>', role=['Audit'])
    async def getDocumentIncome(self, request, id):
        model = await self.session.select(IncomeItem, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        namerole = 'เหรัญญิก'
        user = ''
        try:
            user = await self.getuserrole(namerole)
        except: user = ''
        # user = await self.getuserrole(namerole)
        data['rolename'] = user
        # nameAudit = 'เหรัญญิก'
        # roleroleAudit = ''
        # try: 
        #     roleroleAudit = await self.getuserrole(nameAudit)
        # except: roleroleAudit = ''
        
        # namechairman = 'ประธาน'
        # rolenamechairman = ''
        # try: 
        #     rolenamechairman = await self.getuserrole(namechairman)
        # except: rolenamechairman = ''
        
        # data['roleAudit'] = roleroleAudit
        # data['roleAudit'] = rolenamechairman
        
        date = model.PaymentDate.day
        month = model.PaymentDate.month
        if month == 1: month = 'มกราคม'
        elif month == 2: month = 'กุมภาพันธ์'
        elif month == 3: month = 'มีนาคม'
        elif month == 4: month = 'เมษายน'
        elif month == 5: month = 'พฤษภาคม'
        elif month == 6: month = 'มิถุนายน'
        elif month == 7: month = 'กรกฎาคม'
        elif month == 8: month = 'สิงหาคม'
        elif month == 9: month = 'กันยายน'
        elif month == 10: month = 'ตุลาคม'
        elif month == 11: month = 'พฤศจิกายน'
        elif month == 12: month = 'ธันวาคม'
        year = model.PaymentDate.year + 543
        data['date'] = date
        data['month'] = month
        data['year'] = year
        print(data)
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
    
    async def getuserrole(self,data):
        print('name role get')
        group = await self.session.select(UserGroup, 'WHERE name LIKE ? AND isDrop = 0',parameter=[data],limit=1)
        if len(group) == 0: 
            return Error('')
        print(group[0].id)
        user:List[User] = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
        # user = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
        user = user[0]
        data = user.toDict()
        # print('--------------------------------',data)
        return data
