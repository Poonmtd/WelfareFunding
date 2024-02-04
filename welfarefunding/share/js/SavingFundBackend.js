const SavingFundBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'เงินออม';
	this.model = "SavingFund";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Saving'];
	object.restURL = 'welfarefunding/savingfund';

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		await AbstractPage.prototype.renderTable.call(this, modelName, config);
	}
}