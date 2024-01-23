const WelfareConditionBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'เงื่อนไขการรับสวัสดิการ';
	this.model = "WelfareCondition";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Welfare'];
	object.restURL = 'welfarefunding/welfarecondition';
}