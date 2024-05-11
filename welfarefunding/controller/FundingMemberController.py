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
from welfarefunding.model.SavingFund import SavingFund
from gaimon.model.User import User

import os, string, random, mimetypes, base64

from datetime import datetime


from weasyprint import HTML

from sanic import response

@BASE(FundingMember, "/welfarefunding/fundingmember", "welfarefunding.FundingMember")
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
		date = model.applyDate.day
		month = model.applyDate.month
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
		year = model.applyDate.year + 543
		data['date'] = date
		data['month'] = month
		data['year'] = year

		relationships = model.relationships
		if relationships == 1: relationships = 'บุตร'
		elif relationships == 2: relationships = 'มารดา'
		elif relationships == 3: relationships = 'บิดา'
		elif relationships == 4: relationships = 'พี่/น้อง'
		elif relationships == 5: relationships = 'หลาน'
		elif relationships == 6: relationships = 'ญาติ'
		elif relationships == 7: relationships = 'สามี/ภรรยา'
		elif relationships == -1: relationships = ''
		data['relationships'] = relationships
		for key,value in data.items() :
			if value is None:
				data[key] = ''
  
		age = await self.calculateAge(model.applyDate, model.birthday)
		ageG1 = await self.calculateAge(model.applyDate, model.birthdayG1)
		subDistrictG1 = model.subDistrictIDG1
		if subDistrictG1 == 'ทรัพย์อนันต์' :
			communityG1 = await self.calculateCommunity(model.mooG1)
		else :
			communityG1 = ''
		community = await self.calculateCommunity(model.moo)
		data['age'] = age
		data['community'] = community
		data['ageG1'] = ageG1
		data['communityG1'] = communityG1
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

	# Calculate Age
	async def calculateAge(self, applyDate, birthday):
		print(applyDate)
		print(birthday)
		age = ''
		try:
			age = applyDate.year - birthday.year - ((applyDate.month, applyDate.day) < (birthday.month, birthday.day))
		except: age = ''
		return age

	async def calculateCommunity(self, moo):
		if moo == 1:
			return 'บ้านนาเมือง'
		elif moo == 2:
			return 'บ้านนาหวาน'
		elif moo == 3:
			return 'บ้านแก่งเพกา'
		elif moo == 4:
			return 'บ้านเกาะอม'
		elif moo == 5:
			return 'บ้านนาโครงช้าง'
		elif moo == 6:
			return 'บ้านทรัพย์อนันต์'
		elif moo == 7:
			return 'บ้านทรัพย์สมบูรณ์'
	
	@GET('/welfarefunding/documentsavinglist/by/id/get/<id>', role=['user'])
	async def getDocumentSavingList(self, request, id):
		print('-----------------', id)
		model = await self.session.select(SavingFund, 'WHERE uid = ? ORDER BY id ASC', parameter=[int(id)], isRelated=True)
		user = await self.session.selectByID(User, int(id))
		if user is None: return Error('User does not exist.')
		if len(model) == 0: path = await self.generateDocumentSavingListPDF({'savingList': {}})
		else:
			# # if len(model.path): return await response.file(f"{self.resourcePath}upload/{model.path}")
			# if len(model.path):
			# 	await self.static.removeStaticShare(model.path) # remove old file before generate new file
			data = [i.toDict() for i in model]
			path = await self.generateDocumentSavingListPDF({'user': user.toDict(), 'savingList': data})
			# model.path = path
			# await self.session.update(model)
		print('listttttttttttttttttttttttttttttttttttttttttttttttttt')
		print(data)
		path = f"{self.resourcePath}upload/{path}"
		return await response.file(path)				
	
	async def generateDocumentSavingListPDF(self, data):
		font = await self.getFont()
		template = self.theme.getTemplate('welfarefunding/DocumentSavingList.tpl')
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
