from gaimon.core.Route import GET, POST
from gaimon.core.BaseController import BaseController, BASE
from gaimon.model.PermissionType import PermissionType as PT
from gaimon.core.RESTResponse import(
    RESTResponse as REST,
    ErrorRESTResponse as Error,
    SuccessRESTResponse as Success
)
from welfarefunding.model.FundDocument import FundDocument
from welfarefunding.model.IncomeItem import IncomeItem
from welfarefunding.model.ExpenseItem import ExpenseItem
from welfarefunding.model.BudgetFund import BudgetFund
from welfarefunding.model.SavingFund import SavingFund
from welfarefunding.model.WelfareAppliance import WelfareAppliance
from welfarefunding.model.AboutFund import AboutFund
from welfarefunding.model.FundingMember import FundingMember
from welfarefunding.model.VulnerableGroup import VulnerableGroup
from welfarefunding.model.AboutFund import AboutFund
from gaimon.model.UserGroup import UserGroup
from gaimon.model.User import User

from sanic import response
import os, string, random
from weasyprint import HTML
from typing import List, Dict
from datetime import datetime


@BASE(FundDocument, "/welfarefunding/funddocument", "welfarefunding.FundDocument")
class FundDocumentController(BaseController):
    def __init__(self, application):
        super().__init__(application)

    @GET('/welfarefunding/documentfundperyear/by/id/get/<id>', role=['FundDocument'])
    async def getDocumentFundPerYear(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        path = await self.generateDocumentFundPerYearPDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentFundPerYearPDF(self, data):
        date_start = datetime.strptime(data['startYear'], '%Y-%m-%d')
        date_end = datetime.strptime(data['endYear'], '%Y-%m-%d')
        print('date start------------------',date_start)
        font = await self.getFont()
        
        date = date_end.day
        month = date_end.month
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
        year = date_end.year + 543
        data['date'] = date
        data['month'] = month
        data['year'] = year
        
        
        
        #role ต่างๆ
        rolenamechairman = 'ประธาน'
        userchairman, addresschairman = '',''
        try:
            userchairman,addresschairman  = await self.getuserrole(rolenamechairman)
        except : userchairman,addresschairman = '',''
        
        rolenameCoordinator = 'ผู้ประสานงาน'
        userCoordinator, addressCoordinator = '',''
        try:
            userCoordinator,addressCoordinator  = await self.getuserrole(rolenameCoordinator)
        except : userCoordinator,addressCoordinator = '',''
        
        rolenamesecretary = 'เลขานุการ'
        usersecretary, addresssecretary = '',''
        try:
            usersecretary,addresssecretary  = await self.getuserrole(rolenamesecretary)
        except : usersecretary,addresssecretary = '',''
        
        userRole = await self.getALLUserrole()
        
        calculateIncome = await self.calculateIncome(date_end)
        calculateExpense = await self.calculateExpense(date_start,date_end)
        calculateWelfareAppliance, calculateAllwelfareAppliance = await self.calculateWelfareAppliance(date_start,date_end)
        calculateTypeMember, calculateAllTypeMember = await self.CalculateTypeMember(date_start,date_end)
        template = self.theme.getTemplate('welfarefunding/DocumentFundPerYear.tpl')
        data['font'] = font
        data['calculateIncome'] = calculateIncome 
        data['calculateExpense'] = calculateExpense 
        data['calculateWelfareAppliance'] = calculateWelfareAppliance 
        data['calculateAllWelfareAppliance'] = calculateAllwelfareAppliance
        data['calculateTypeMember'] = calculateTypeMember
        data['calculateAllTypeMember'] = calculateAllTypeMember
        #กองทุน
        
        #ประธาน
        data['userchairman'] = userchairman
        data['addresschairman'] = addresschairman
        #ประสานงาน
        data['userCoordinator'] = userCoordinator
        data['addressCoordinator'] = addressCoordinator
        #เลขานุการ
        data['usersecretary'] = usersecretary
        data['addresssecretary'] = addresssecretary
        #Alluser
        # data['alluser'] = userRole
        
        html = self.renderer.render(template, data)
        letters = string.ascii_lowercase
        fileName = ''.join(random.choice(letters) for i in range(20))
        path = self.resourcePath + "upload/welfarefunding/document"
        os.makedirs(path, exist_ok=True)
        pathFile = path + "/%s.pdf" % (fileName)
        html = HTML(string=html)
        html.write_pdf(pathFile)
        pathUpload = "welfarefunding/document/%s.pdf" % (fileName)
        print('---------------------------------',data)
        print('--------------- GENERATE PDF FINISHED ---------------')
        return pathUpload
    
    async def getFont(self):
        font = self.theme.getTemplate('welfarefunding/FontFamily.tpl')
        font = self.renderer.render(font, {})
        return font
    
    async def getuserrole(self,data):
        print('name role get')
        group = await self.session.select(UserGroup, 'WHERE name LIKE ?',parameter=[data],limit=1)
        if len(group) == 0: return Error('')
        print(group[0].id)
        user:List[User] = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
        # user = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
        user = user[0]
        datauser:List[FundingMember] = await self.session.select(FundingMember, 'WHERE uid = ?', parameter=[user.id])
        datauser = datauser[0]
        data = user.toDict()
        userdata = datauser.toDict()
        
        subDistrict = datauser.subDistrictID
        community = ''
        if subDistrict == 'ทรัพย์อนันต์' :
            community = await self.calculateCommunity(datauser.moo)
        else :
            community = ''        
        
        userdata['community'] = community
		# print('--------------------------------',data)
        return data,userdata
    
    async def calculateCommunity(self, moo):
        if moo == 1: return 'บ้านนาเมือง'
        elif moo == 2: return 'บ้านนาหวาน'
        elif moo == 3: return 'บ้านแก่งเพกา'
        elif moo == 4: return 'บ้านเกาะอม'
        elif moo == 5: return 'บ้านนาโครงช้าง'
        elif moo == 6: return 'บ้านทรัพย์อนันต์'
        elif moo == 7: return 'บ้านทรัพย์สมบูรณ์'
        
    async def getALLUserrole(self):        
        users:List[User] = await self.session.select(User, 'WHERE gid != ?', parameter=[-1])
        mergedData = []
        for user in users:
            usermembers:List[FundingMember] = await self.session.select(FundingMember,'WHERE uid = ?',parameter = [user.id])
            userDict = user.toDict()
            for member in usermembers:
                memberDict = member.toDict()
                mergedUserDict = {**userDict, **memberDict}
                mergedData.append(mergedUserDict)
        print(mergedData)
        return users

        
    # async def getAllUserRloe(self) :
    #     user:List[User] = await self.session.select(User, 'WHERE gid != ?', parameter=[-1])
    #     # datauser:List[FundingMember] = await self.session.select(FundingMember, 'WHERE uid = ?', parameter=[user.id])
    #     datauser = datauser[0]
    #     data = user.toDict()
    #     userdata = datauser.toDict()
    #     return data
    
    # async def getuserrole(self,data):
    #     group = await self.session.select(UserGroup, 'WHERE name LIKE ?',parameter=[data],limit=1)
    #     if len(group) == 0: return Error('')
    #     print(group[0].id)
    #     user:List[User] = await self.session.select(User, 'WHERE gid = ?', parameter=[group[0].id])
    #     user = user[0]
    #     datauser:List[FundingMember] = await self.session.select(FundingMember, 'WHERE uid = ?', parameter=[user.id])
    #     datauser = datauser[0]
    #     datauser1 = datauser.toDict()
    #     data = user.toDict()
    #     print('user id::', user.id)
    #     print('data:',datauser1)
    #     return data
    ##############################################################################################################################
    # @GET('/welfarefunding/testcalculate/by/id/get/<id>', role=['FundDocument'])
    # async def getDocumentTestCalculate(self, request, id):
    #     model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
    #     if len(model) == 0: return Error('Member does not exist.')
    #     model = model[0]
    #     data = model.toDict()
    #     path = await self.generateDocumentTestCalculatePDF(data)
    #     model.path = path
    #     await self.session.update(model)
    #     path = f"{self.resourcePath}upload/{path}"
    #     return await response.file(path)
    
    # async def generateDocumentTestCalculatePDF(self, data):
    #     date_start = datetime.strptime(data['startYear'], '%Y-%m-%d')
    #     date_end =datetime.strptime(data['endYear'], '%Y-%m-%d')
    #     font = await self.getFont()
    #     calculateIncome = await self.calculateIncome(date_end)
    #     calculateExpense = await self.calculateExpense(date_start,date_end)
    #     calculateWelfareAppliance, calculateAllwelfareAppliance = await self.calculateWelfareAppliance(date_start,date_end)
    #     calculateTypeMember, calculateAllTypeMember = await self.CalculateTypeMember(date_start,date_end)
    #     template = self.theme.getTemplate('welfarefunding/TestCalculate.tpl')
    #     data['font'] = font
    #     data['calculateIncome'] = calculateIncome 
    #     data['calculateExpense'] = calculateExpense 
    #     data['calculateWelfareAppliance'] = calculateWelfareAppliance 
    #     data['calculateAllWelfareAppliance'] = calculateAllwelfareAppliance
    #     data['calculateTypeMember'] = calculateTypeMember
    #     data['calculateAllTypeMember'] = calculateAllTypeMember
    #     html = self.renderer.render(template, data)
    #     letters = string.ascii_lowercase
    #     fileName = ''.join(random.choice(letters) for i in range(20))
    #     path = self.resourcePath + "upload/welfarefunding/document"
    #     os.makedirs(path, exist_ok=True)
    #     pathFile = path + "/%s.pdf" % (fileName)
    #     html = HTML(string=html)
    #     html.write_pdf(pathFile)
    #     pathUpload = "welfarefunding/document/%s.pdf" % (fileName)
    #     print('--------------- GENERATE PDF FINISHED ---------------')
    #     print(calculateTypeMember)
    #     print(data)
    #     print('------------------------------------------------------')
    #     return pathUpload
    
    @GET("/welfarefunding/incomeitem/get/all/income")
    async def getIncomeItemOption(self, request) :
        return self.calculateIncome()
    
    async def calculateIncome(self, endDate:datetime):
        print("-----------------------------------TEST CALCURATE-----------------------------------------------------")
        income_clause = 'WHERE isDrop = ? AND PaymentDate <= ?'
        models_income:List[IncomeItem] = await self.session.select(IncomeItem, income_clause, parameter=[0, endDate])
        
        saving_clause = 'WHERE isDrop = ? AND savingDate <= ?'
        models_saving:List[SavingFund] = await self.session.select(SavingFund, saving_clause, parameter=[0,endDate])

        budget_clause = 'WHERE isDROP = ? AND BudgetFundDate <= ?'
        models_budget:List[BudgetFund] = await self.session.select(BudgetFund, budget_clause, parameter=[0,endDate]) 
        
        income_dict: Dict[str, float] = {}
        
        income_dict.setdefault('รวมรายรับ',0.00)
        income_dict.setdefault('รายได้',0.00)
        income_dict.setdefault('รายรับ',0.00)
        
        for income in models_income :
            income_type = str(income.incomeType)
            paymentAmount = income.Amount
            
            income_dict.setdefault(income_type,0.00)
            income_dict[income_type] += paymentAmount
            income_dict['รวมรายรับ'] += paymentAmount
            income_dict['รายรับ'] += paymentAmount
            
        for saving in models_saving :
            income_type = 'เงินสมทบจากสมาชิก'
            paymentAmount = saving.savingAmount
            
            income_dict.setdefault(income_type,0.00)
            income_dict[income_type] += paymentAmount
            income_dict['รวมรายรับ'] += paymentAmount
            income_dict['รายรับ'] += paymentAmount
            
        for budget in models_budget :
            income_type = str(budget.budgetType)
            paymentAmount = budget.budgetFundAmount
            if budget.budgetStatus == 3 :
                income_dict.setdefault(income_type,0.00)
                income_dict[income_type] += paymentAmount   # budtype ยังไปรวมกัน income type อยู่เพราะว่าตัวเลขเป็นตัวเลขเดียวกัน
                income_dict['รายได้'] += paymentAmount
                income_dict['รวมรายรับ'] += paymentAmount
        
        # combined_data = [(income_type,paymentAmount) for income_type,paymentAmount in income_dict.items()]
        # print(income_dict)
        
        
        return income_dict
        
        # return Success(income_dict)
        
    async def calculateExpense(self,startDate:datetime, endDete:datetime) :
        print("-----------------------------------TEST EXPENSE-----------------------------------------------------")
        
        expense_clause = 'WHERE isDrop = ? AND PaymentDate <= ?'
        models_expense:List[ExpenseItem] = await self.session.select(ExpenseItem, expense_clause, parameter=[0, endDete])
        
        walfareAppliance_clause = 'WHERE isDrop = ? AND ApplianceDate <= ?'
        models_welfareAppliance:List[WelfareAppliance] = await self.session.select(WelfareAppliance, walfareAppliance_clause, parameter=[0, endDete])
        
        aboutfund_clause = 'WHERE isDrop = ? AND applyDate >= ? AND applyDate <= ?'
        models_aboutfund:List[AboutFund] = await self.session.select(AboutFund, aboutfund_clause, parameter=[0,startDate,endDete])
        
        expense_dict: Dict[str, float] = {}
        expense_dict.setdefault('รวมรายจ่าย',0.00)
        expense_dict.setdefault('ค่าใช้จ่าย',0.00)
        expense_dict.setdefault('รายจ่าย',0.00)
        
        for expense in models_expense :
            expense_type = str(expense.expenseType)
            paymentAmount = expense.Amount
            
            expense_dict.setdefault(expense_type,0.00)
            expense_dict[expense_type] += paymentAmount ## if ธนาคารหมู่บ้านต้องไปอยู่ใน รายจ่าย
            if (expense_type == 1) or (expense_type == 2):
                expense_dict['รวมรายจ่าย'] += paymentAmount
                expense_dict['รายจ่าย'] += paymentAmount
            else :
                expense_dict['รวมรายจ่าย'] += paymentAmount
                expense_dict['ค่าใช้จ่าย'] += paymentAmount
            
        for welfare in models_welfareAppliance :
            expense_type = 'จ่ายสวัสดิการให้สมาชิก'
            paymentAmount = welfare.Amount
            
            expense_dict.setdefault(expense_type,0.00)
            expense_dict[expense_type] += paymentAmount
            expense_dict['รวมรายจ่าย'] += paymentAmount
            expense_dict['รายจ่าย'] += paymentAmount
        
        for aboutfund in models_aboutfund:
            if aboutfund.bankBalance is not None:
                expense_dict.setdefault('เงินฝากธนาคาร',0.00)
                expense_dict['เงินฝากธนาคาร'] += aboutfund.bankBalance
                expense_dict['รวมรายจ่าย'] += aboutfund.bankBalance
                expense_dict['รายจ่าย'] += aboutfund.bankBalance
            
            if aboutfund.cash is not None:
                expense_dict.setdefault('เงินสดในมือ',0.00)
                expense_dict['เงินสดในมือ'] += aboutfund.cash
                expense_dict['รวมรายจ่าย'] += aboutfund.cash
                expense_dict['รายจ่าย'] += aboutfund.cash
            
                
        # combined_data = [(income_type,paymentAmount) for income_type,paymentAmount in income_dict.items()]
        # print(expense_dict)
        return expense_dict
    
    async def calculateWelfareAppliance(self, startDate:datetime, endDate:datetime) :        
        clause = 'WHERE isDrop = ? AND ApplianceDate >= ? AND ApplianceDate <= ?'
        models:List[WelfareAppliance] = await self.session.select(WelfareAppliance, clause, parameter=[0,startDate,endDate])
        
        clause_all = 'WHERE isDrop = ?'
        models_all:List[WelfareAppliance] = await self.session.select(WelfareAppliance, clause_all, parameter=[0])
        
        appliancs_dict: Dict[str, float] = {}
        applianceAll_dict : Dict[str, float] = {}
        
        appliancs_dict.setdefault('จำนวนคนรวม',0.00)
        appliancs_dict.setdefault('จำนวนเงินรวม',0.00)
        
        applianceAll_dict.setdefault('จำนวนคนรวมสะสม',0.00)
        applianceAll_dict.setdefault('จำนวนเงินรวมสะสม',0.00)
        
        for appliance in models :
            
            welfare_type = str(appliance.welfareType)
            paymentAmount = appliance.Amount
            
            appliancs_dict.setdefault(welfare_type,0.00)
            appliancs_dict[welfare_type] += paymentAmount
            
            appliancs_dict.setdefault('จำนวนคนของ'+welfare_type, 0.00)
            appliancs_dict['จำนวนคนของ'+welfare_type] += 1  
            
            appliancs_dict['จำนวนคนรวม'] += 1
            appliancs_dict['จำนวนเงินรวม'] += paymentAmount
            
            
        for appliance_all in models_all:
            welfare_type = str(appliance_all.welfareType)
            paymentAmount = appliance_all.Amount
            
            applianceAll_dict.setdefault(welfare_type,0.00)
            applianceAll_dict[welfare_type] += paymentAmount
            
            applianceAll_dict.setdefault('จำนวนคนของ'+welfare_type, 0.00)
            applianceAll_dict['จำนวนคนของ'+welfare_type] += 1
            
            applianceAll_dict['จำนวนคนรวมสะสม'] += 1
            applianceAll_dict['จำนวนเงินรวมสะสม'] += paymentAmount
        
        countAppliance = (len(appliancs_dict)/2)-1
        print('---------------------------------------------',appliancs_dict)
        countApplianceAll = (len(applianceAll_dict)/2)-1
        appliancs_dict.setdefault('จำนวนสวัสดิการ',0.00)
        appliancs_dict['จำนวนสวัสดิการ'] = countAppliance
        
        applianceAll_dict.setdefault('จำนวนสวัสดิการสะสม',0.00)
        applianceAll_dict['จำนวนสวัสดิการสะสม'] = countApplianceAll
        
        return appliancs_dict, applianceAll_dict,
    
    async def CalculateTypeMember(self, stareDate:datetime, endDate:datetime):
        print("-----------------------------------TEST TYPE-----------------------------------------------------")

        clause = 'WHERE isDrop = ? AND applyDate <= ?'
        models:List[FundingMember] = await self.session.select(FundingMember, clause, parameter=[0,endDate])
        
        clauseAll = 'WHERE isDrop IN (?,?)'
        models_all:List[FundingMember] = await self.session.select(FundingMember, clauseAll, parameter=[0,1])
        
        typeMember_dict: Dict[str, float] = {}
        typeMemberAll_dict: Dict[str, float] = {}
        
        typeMember_dict.setdefault('รวม',0)
        
        typeMemberAll_dict.setdefault('รวมสะสม',0)
        
        for member in models:
            if member.isDrop == 0:
                if(member.VulnerableGroup != -1 and member.VulnerableGroup != None) :
                    memberType = VulnerableGroup.label[member.VulnerableGroup]
                    
                    typeMember_dict.setdefault(memberType,0)
                    typeMember_dict[memberType] += 1
                    typeMember_dict['รวม'] += 1
                else :
                    age = await self.calculateAge(member.birthday ,endDate)
                    typeMember_dict['รวม'] += 1
                    if age <= 18:
                        typeMember_dict.setdefault('เด็ก',0)
                        typeMember_dict['เด็ก'] += 1
                    elif age >= 60 :
                        typeMember_dict.setdefault('ผู้สูงอายุ',0)
                        typeMember_dict['ผู้สูงอายุ'] += 1
                    else :
                        typeMember_dict.setdefault('ทั่วไป',0)
                        typeMember_dict['ทั่วไป'] += 1
        
        for memberall in models_all :
            if (memberall.VulnerableGroup != -1 and memberall.VulnerableGroup != None) :
                memberType = VulnerableGroup.label[memberall.VulnerableGroup]
                typeMemberAll_dict.setdefault(memberType,0)
                typeMemberAll_dict[memberType] += 1
                typeMemberAll_dict['รวมสะสม'] += 1
            else :
                age = await self.calculateAge(memberall.birthday, endDate)
                typeMemberAll_dict['รวมสะสม'] += 1
                if age <=18 :
                    typeMemberAll_dict.setdefault('เด็ก',0)
                    typeMemberAll_dict['เด็ก'] += 1
                elif age >=60 :
                    typeMemberAll_dict.setdefault('ผู้สูงอายุ',0)
                    typeMemberAll_dict['ผู้สูงอายุ'] += 1
                else :
                    typeMemberAll_dict.setdefault('ทั่วไป',0)
                    typeMemberAll_dict['ทั่วไป'] += 1
            
        return typeMember_dict ,typeMemberAll_dict
    
    async def calculateAge(self, birthday ,endday):
        # print("-----------------------------------TEST AGE-----------------------------------------------------")
        # today = datetime.now()
        # print("----------------------------------------",endday)
        # differenceTime = today.year-applyDate.year
        age = ''
        try : 
            if birthday.year > endday.year:
                birthday.year += 543
            age = endday.year - birthday.year - ((endday.month, endday.day) < (birthday.month, birthday.day))
        except: age = 0
        return age
    
    @GET('/welfarefunding/transferrequestform/by/id/get/<id>', role=['FundDocument'])
    async def getDocumentTransferRequestForm(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        # data = await self.calculateIncome()
        path = await self.generateDocumentTransferRequestFormPDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentTransferRequestFormPDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/TransferRequestForm.tpl')
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
    
    @GET('/welfarefunding/complaintletter/by/id/get/<id>', role=['FundDocument'])
    async def getDocumentComplaintLetter(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        # data = await self.calculateIncome()
        path = await self.generateDocumentComplaintLetterPDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentComplaintLetterPDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/ComplaintLetter.tpl')
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
    
    @GET('/welfarefunding/requestbudget/by/id/get/<id>', role=['FundDocument'])
    async def getDocumentRequestBudget(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        # data = await self.calculateIncome()
        path = await self.generateDocumentRequestBudgetPDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateDocumentRequestBudgetPDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/DocumentRequestBudget.tpl')
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
    
    @GET('/welfarefunding/taxdocument/by/id/get/<id>', role=['user'])
    async def getDocumentTax(self, request, id):
        model = await self.session.select(FundDocument, 'WHERE id = ?', parameter=[int(id)], isRelated=True, limit=1)
        if len(model) == 0: return Error('Member does not exist.')
        model = model[0]
        data = model.toDict()
        # data = await self.calculateIncome()
        path = await self.generateTaxDocumentPDF(data)
        model.path = path
        await self.session.update(model)
        path = f"{self.resourcePath}upload/{path}"
        return await response.file(path)
    
    async def generateTaxDocumentPDF(self, data):
        font = await self.getFont()
        template = self.theme.getTemplate('welfarefunding/TaxDocument.tpl')
        data['font'] = font
        html = self.renderer.render(template, data)
        letters = string.ascii_lowercase
        fileName = ''.join(random.choice(letters) for i in range(20))
        path = self.resourcePath + "upload/welfarefunding/document"
        os.makedirs(path, exist_ok=True)
        await self.generateHTML(html, path)
        pathFile = path + "/%s.pdf" % (fileName)
        html = HTML(string=html)
        html.write_pdf(pathFile)        
        pathUpload = "welfarefunding/document/%s.pdf" % (fileName)
        print('--------------- GENERATE PDF FINISHED ---------------')
        return pathUpload
    
    async def generateHTML(self, template, path):
        path = f'{path}/Debug.html'
        with open(path, 'w') as fd:
            fd.write(template)