const FundingIncomeBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'Income';
	this.model = "FundingIncome";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundingIncome'];
	object.restURL = 'welfarefunding/fundingincome';
}