const FundingExpenseBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'Expense';
	this.model = "FundingExpense";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundingExpense'];
	object.restURL = 'welfarefunding/fundingexpense';
}