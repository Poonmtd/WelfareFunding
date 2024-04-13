const GrenteeBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'ผู้รับสิทธิ์';
	this.model = "Grentee";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundingMember'];
	object.restURL = 'welfarefunding/grentee';

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		await AbstractPage.prototype.renderTable.call(this, modelName, config);
	}
}