const AboutFundBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'ข้อมูลกองทุน';
	this.model = "AboutFund";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['AboutFund'];
	object.restURL = 'welfarefunding/aboutfund';

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		await AbstractPage.prototype.renderTable.call(this, modelName, config);
	}
}