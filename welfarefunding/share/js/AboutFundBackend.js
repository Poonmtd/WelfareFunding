const AboutFundBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'AboutFund';
	this.model = "AboutFund";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['AboutFund'];
	object.restURL = 'welfarefunding/aboutfund';
}