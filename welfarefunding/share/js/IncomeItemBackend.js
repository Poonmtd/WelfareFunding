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
		// await AbstractPage.prototype.renderTable.call(this, modelName, config);
		config.operation = [
			{label: 'ใบเสร็จรับเงิน', ID: 'pdf', icon: 'welfarefunding.PDF'}
		]
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		for(let i in table.records){
			let record = table.records[i];
			console.log(record.record);
			record.dom.pdf.onclick = async function(){
				let blob = await GET(`welfarefunding/documentincome/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
		}
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