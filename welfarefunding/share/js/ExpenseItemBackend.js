const ExpenseItemBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'รายจ่าย';
	this.model = "ExpenseItem";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Audit'];
	object.restURL = 'welfarefunding/expenseitem';

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		// await AbstractPage.prototype.renderTable.call(this, modelName, config);
		config.operation = [
			{label: 'ใบเสร็จรับเงิน', ID: 'pdf', icon: 'welfarefunding.PDF'}
		]
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		for(let i in table.records){
			let record = table.records[i];
			console.log(record.record);
			record.dom.pdf.onclick = async function(){
				let blob = await GET(`welfarefunding/documentexpense/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
		}
	}
}