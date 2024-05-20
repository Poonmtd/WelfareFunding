from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.ExpenseItem import ExpenseItem

from sanic import response
import os, string, random
from weasyprint import HTML

from typing import List

from gaimon.model.UserGroup import UserGroup
from gaimon.model.User import User

@BASE(ExpenseItem, "/welfarefunding/expenseitem", "welfarefunding.ExpenseItem")
class ExpenseItemController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET('/welfarefunding/documentexpense/by/id/get/<id>', role=['Audit'])
    async def getDocumentExpense(self, request, id):
        model = await self.session.select(ExpenseItem, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        nameroleAudit = 'เหรัญญิก'
        userAudit = ''
        # user = await self.getuserrole(namerole)
        try:
            userAudit = await self.getuserrole(nameroleAudit)
        except : userAudit = ''
        data['roleAudit'] = userAudit
        rolenamechairman = 'ประธาน'
        userchairman = ''
        try:
            userchairman = await self.getuserrole(rolenamechairman)
        except : userchairman = ''
        
        data['userchairman'] = userchairman
        
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
        path = await self.generateDocumentExpensePDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentExpensePDF(self, data):
        print(data)
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/DocumentExpense.tpl')
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
        group = await self.session.select(UserGroup, 'WHERE name LIKE ?',parameter=[data],limit=1)
        if len(group) == 0: 
            return Error('')
        print(group[0].id)
        user:List[User] = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
        user = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
        user = user[0]
        data = user.toDict()
        # print('--------------------------------',data)
        return data