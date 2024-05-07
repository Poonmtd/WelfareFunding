# import csv, json, welfarefunding

# class MemberDataMigration:
# 	def __init__(self) :
# 		self.rootPath = welfarefunding.__path__[0]
	
# 	def migrate(self, path: str):
# 		raw = []
# 		with open(f'{self.rootPath}/{path}') as fd :
# 			reader = csv.reader(fd)
# 			for i in reader:
# 				raw.append(i)
# 		print(raw)

# if __name__ == '__main__':
# 	migration = MemberDataMigration()
# 	migration.migrate('file/member.csv')

import psycopg2
from psycopg2 import Error
import csv, json, welfarefunding

class MemberDataMigration:
	def __init__(self) :
		self.rootPath = welfarefunding.__path__[0]
	
	def migrate(self, path: str):
		print('------------------------')
		connection = None
  
		try:
			connection = psycopg2.connect(user='nagaUser',
									password='11223344',
									host='localhost',
									port='5432',
									database='welfare')
			# print(connection)
			cursor = connection.cursor()
			# raw = []
			with open(f'{self.rootPath}/{path}') as fd :
				reader = csv.reader(fd)
				next(reader)
				for row in reader:
        
					firstname = row[5] if row[5] != '' else None
					lastname = row[6] if row[6] != '' else None
					membernumber = row[2] if row[2] != '' else None
					citizenid = row[3] if row[3] != '' else None
					nametitle = row[4] if row[4] != '' else None
					gender = row[7] if row[7] != '' else None
					addressnumber = row[8] if row[8] != '' else None
					moo = row[9] if row[9] != '' else None
					applydate = row[10] if row[10] != '' else None
					birthday = row[11] if row[11] != '' else None
					resigndate = row[12] if row[12] != '' else None
					datedeath = row[13] if row[13] != '' else None
					print(datedeath)

					cursor.execute("INSERT INTO gaimonuser (firstname,lastname) VALUES (%s,%s)",
                    (firstname,lastname))
					cursor.execute("SELECT MAX(id) FROM gaimonuser")
					uid = cursor.fetchone()[0]
					# uid = cursor.lastrowid
					cursor.execute("INSERT INTO fundingmember (membernumber, citizenid, nametitle, gender, addressnumber, moo, applydate, birthday, resigndate, datedeath, uid) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s)",
                	(membernumber,citizenid,nametitle,gender,addressnumber,moo,applydate,birthday,resigndate,datedeath,uid))
     
			connection.commit()
			print("Data migrated successfully!")
   			# print("Data migrated successfully!")
			# 	for i in reader:
			# 		raw.append(i)
			# print(raw)

		except (Exception, Error) as error :
			print("Error while connecting to PostgreSQL", error)
   
		finally:
            # Close database connection
			if connection:
				cursor.close()
				connection.close()
				print("PostgreSQL connection is closed.")
   

if __name__ == '__main__':
	migration = MemberDataMigration()
	migration.migrate('file/member1.csv')