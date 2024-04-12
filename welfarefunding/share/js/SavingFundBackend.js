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
		//await AbstractPage.prototype.renderTable.call(this, modelName, config);
		// let limit=10;
		// object.limit = limit;
		// let data = {
		// 	pageNumber: object.pageNumber,
		// 	limit: limit,
		// 	data : object.filter
		// }
		// let result = await main.protocol.user.getAllUser(data);
		config.operation = [
			{label: 'PDF', ID: 'pdf', icon: 'welfarefunding.PDF'}
		];
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		for(let i in table.records){
			let record = table.records[i];
			console.log(record.record);
			record.dom.pdf.onclick = async function(){
				let blob = await GET(`welfarefunding/documentsaving/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
		}
		// table.onCreateRecord = async function(record) {
		// 	console.log(record);
		// 	record.dom.pdf.onclick = async function(){
		// 		let blob = await GET(`welfarefunding/documentsaving/by/id/get/${record.record.id}`, undefined, 'blob');
		// 		await OPEN_FILE(blob);
		// 	}
		// }
		// await table.createMultipleRecord(result.data);

	}
}