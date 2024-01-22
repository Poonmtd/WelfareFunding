const FundingMemberBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'Member';
	this.model = "FundingMember";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundingMember'];
	object.restURL = 'welfarefunding/fundingmemmber';
}