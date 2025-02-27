const WelfareTypeBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'ประเภทสวัสดิการ';
	this.model = "WelfareType";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Welfare'];
	object.restURL = 'welfarefunding/welfaretype';

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		await AbstractPage.prototype.renderTable.call(this, modelName, config);
	}
}