import csv, json, welfarefunding

class MemberDataMigration:
	def __init__(self) :
		self.rootPath = welfarefunding.__path__[0]
	
	def migrate(self, path: str):
		raw = []
		with open(f'{self.rootPath}/{path}') as fd :
			reader = csv.reader(fd)
			for i in reader:
				raw.append(i)
		print(raw)

if __name__ == '__main__':
	migration = MemberDataMigration()
	migration.migrate('file/member.csv')