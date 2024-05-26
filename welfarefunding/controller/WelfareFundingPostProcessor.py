from datetime import datetime
import json
from gaimon.core.PostProcessor import PostProcessDecorator, POST
from gaimon.core.RESTResponse import RESTResponse

from welfarefunding.model.FundingMember import FundingMember
from sanic import Request
from typing import List

from gaimon.core.RESTResponse import (
 RESTResponse as REST,
 ErrorRESTResponse as Error,
 SuccessRESTResponse as Success,
)
from gaimon.util.RequestUtil import (
 createFileStore
)

class WelfareFundingPostProcessor (PostProcessDecorator) :
 @POST('/user/insert')
 async def insertUser(self, request:Request, response:RESTResponse) :
  if not response.data['isSuccess']: return response
  data = response.data['result']
  print('data-------------------------------------------',data)
  model = FundingMember()
  model.fromDict(data['additional'])
  model.uid = data['id']
  print(data['additional']['applyDate'])
  # datechange = await self.changedate(data['additional']['applyDate'])
  # print(datechange)
  # data['additional']['applyDate'] = await self.changedate(data['additional']['applyDate'])
  # model.citizenID = data['additional']['citizenID']
  # model.telephoneNumber = data['additional']['telephoneNumber']
  # model.birthday = data['additional']['birthday']
  # model.applyDate = data['additional']['applyDate']
  # model.gender = data['additional']['gender']
  # model.maritalStatus = data['additional']['maritalStatus']
  # model.grantee_one = data['additional']['grantee_one']
  # model.grantee_two = data['additional']['grantee_two']
  # add data ใส่ข้อมูลตาม model fundingmember
  model.applyDate = await self.changedate(data['additional']['applyDate'])
  model.birthday = await self.changedate(data['additional']['birthday'])
  model.birthdayG1 = await self.changedate(data['additional']['birthdayG1'])
  model.resignDate = await self.changedate(data['additional']['resignDate'])
  model.dateDeath = await self.changedate(data['additional']['dateDeath'])
  await self.session.insert(model)
  return response

 async def changedate(self,date):
   today = datetime.now().year
   print(today)
   if isinstance(date, str):
    date_format = "%Y-%m-%d"
    date = datetime.strptime(date, date_format)
    print(date)
    print(date.year)
    # print(date)
    if date.year > today:
       print('123456789')
       datenew = date.replace(year=date.year - 543)
    else : datenew = date
   return datenew
 
 @POST("/user/update")
 async def updateUser(self, request:Request, response:RESTResponse) :
  if not response.data['isSuccess']: return response
  data = response.data['result']
  print(data['additional']['applyDate'])
  print("------------------------------------")
  print(data['isDrop'])
  isUpdate = False
  model = FundingMember()
  print(model.isDrop)
  if 'id' in data:    
   model = await self.session.select(FundingMember, 'WHERE uid=?', parameter=[data['id']], limit=1)
   print(data)
   if len(model) == 0:
    isUpdate = False
    model = FundingMember()
   else:
    isUpdate = True
    model = model[0]
    # print('testprintmodel before update',model.birthday) # ตรงนี้เอาไว้ isDrop เมื่อ resign and death
  uid = data['id']
  del data['id']
  del data['additional']['id']
  model.fromDict(data['additional'])
  model.uid = uid
  model.dateDeath = None
  try :
      model.dateDeath = await self.changedate(data['additional']['dateDeath'])
  except : model.dateDeath = None
  # model.dateDeath = await self.changedate(data['additional']['dateDeath'])
  model.resignDate = None
  try :
    model.resignDate = await self.changedate(data['additional']['resignDate'])
  except : model.resignDate = None
  
  if (model.dateDeath or model.resignDate) is not None:
    print('not None')
    model.isDrop = 1
  # model.dateDeath = await self.changedate(data['additional']['dateDeath'])
  # model.citizenID = data['additional']['citizenID']
  # model.telephoneNumber = data['additional']['telephoneNumber']
  # model.birthday = data['additional']['birthday']
  # model.applyDate = data['additional']['applyDate']
  # model.gender = data['additional']['gender']
  # model.maritalStatus = data['additional']['maritalStatus']
  # model.grantee_one = data['additional']['grantee_one']
  # model.grantee_two = data['additional']['grantee_two']
  # add data ใส่ข้อมูลตาม model fundingmember
  if isUpdate: await self.session.update(model)
  else: await self.session.insert(model)
  return response

 @POST('/user/drop')
 async def dropUser(self, request:Request, response:RESTResponse):
  data = response.data['result']
  model = await self.session.select(FundingMember, "WHERE uid=?", parameter=[data['id']], limit=1, isRelated=True)
  if len(model) == 0: return response
  model = model[0]
  model.isDrop = 1
  await self.session.update(model)
  return response
 
 @POST('/user/get/by/id')
 async def getUserByID(self, request:Request, response:RESTResponse):
  data = response.data['result']
  model = await self.session.select(FundingMember, "WHERE uid=?", parameter=[data['id']], limit=1, isRelated=True)
  if len(model) == 0: return response
  model = model[0].toDict()
  del model['id']
  data.update(model)
  return response
 
 @POST('/user/global/get/by/id')
 async def getUserGlobalByID(self, request:Request, response:RESTResponse):
  data = response.data['result']
  model = await self.session.select(FundingMember, "WHERE uid=?", parameter=[data['id']], limit=1, isRelated=True)
  if len(model) == 0: return response
  model = model[0].toDict()
  del model['id']
  data.update(model)
  return response

 @POST('/user/get/all')
 async def getAllUser(self, request:Request, response:RESTResponse):
  data = response.data['result']['data']
  idList = ', '.join([str(i['id']) for i in data])
  if len(idList): clause = f"WHERE uid IN ({idList})"
  print(clause)
  model = await self.session.select(FundingMember, clause)
  modelDict = {i.uid: i.toDict() for i in model}
  for item in data:
   if item['id'] not in modelDict: continue
   try:
    del modelDict[item['id']]['id']
    item.update(modelDict[item['id']])
   except: pass
  return response