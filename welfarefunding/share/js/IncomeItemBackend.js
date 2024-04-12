const IncomeItemBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'รายรับ';
	this.model = "IncomeItem";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Audit'];
	object.restURL = 'welfarefunding/incomeitem';

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		await AbstractPage.prototype.renderTable.call(this, modelName, config);
	}

	// this.renderTableView = async function(modelName, config = {}) {
    //     config.hasAvatar = false;
    //     const response = await GET('welfarefunding/incomeitem/get/all/income');

    //     if (response.status == 'success') {
    //         const data = response.data;
	// 		console.log(data)
    //         await AbstractPage.prototype.renderTable.call(this, modelName, data);
    //     } else {
    //         console.error('Error fetching data:', response.message);
    //     }
    // }

}