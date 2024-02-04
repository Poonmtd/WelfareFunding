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
		await AbstractPage.prototype.renderTable.call(this, modelName, config);
	}
}