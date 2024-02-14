const FundCommitteeBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'Committee';
	this.model = "FundCommittee";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundingMember'];
	object.restURL = 'welfarefunding/fundcommittee';
}