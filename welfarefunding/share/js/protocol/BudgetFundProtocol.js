const BudgetFundProtocol = function(main){
    this.getAll = async function(data){
		let response = await POST('welfarefunding/budgetfund/get/all', data);
		if (response == undefined) return [];
		if (response.isSuccess) return response.result;
		return [];
	}
}