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
  print(data)
  model = FundingMember()
  model.fromDict(data['additional'])
  model.uid = data['id']
  # model.citizenID = data['additional']['citizenID']
  # model.telephoneNumber = data['additional']['telephoneNumber']
  # model.birthday = data['additional']['birthday']
  # model.applyDate = data['additional']['applyDate']
  # model.gender = data['additional']['gender']
  # model.maritalStatus = data['additional']['maritalStatus']
  # model.grantee_one = data['additional']['grantee_one']
  # model.grantee_two = data['additional']['grantee_two']
  # add data ใส่ข้อมูลตาม model fundingmember
  await self.session.insert(model)
  return response
 
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
  uid = data['id']
  del data['id']
  del data['additional']['id']
  model.fromDict(data['additional'])
  model.uid = uid
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
  model = await self.session.select(FundingMember, clause)
  modelDict = {i.uid: i.toDict() for i in model}
  for item in data:
   if item['id'] not in modelDict: continue
   del modelDict[item['id']]['id']
   item.update(modelDict[item['id']])
  return response