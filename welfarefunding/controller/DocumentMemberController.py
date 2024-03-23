from welfarefunding.model.FundingMember import FundingMember

async def getDataDocumentFormat(model):
    data = model.toDict()
    data['citizenID'] = FundingMember.label[data['citizenID']]
    data['telephoneNumber'] = FundingMember.label[data['telephoneNumber']]
    data['birthday'] = FundingMember.label[data['birthday']]
    data['applyDate'] = FundingMember.label[data['applyDate']]
    data['gender'] = FundingMember.label[data['gender']]
    data['maritalStatus'] = FundingMember.label[data['maritalStatus']]
    data['grantee_one'] = FundingMember.label[data['grantee_one']]
    data['grantee_two'] = FundingMember.label[data['grantee_two']]