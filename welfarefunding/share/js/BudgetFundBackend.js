const BudgetFundBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'งบประมาณ';
	this.model = "BudgetFund";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Audit'];
	object.restURL = 'welfarefunding/budgetfund';
}