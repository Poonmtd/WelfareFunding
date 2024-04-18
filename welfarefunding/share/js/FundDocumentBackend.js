const FundDocumentBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'FundDocument';
	this.model = "FundDocument";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundDocument'];
	object.restURL = 'welfarefunding/funddocument';

	this.renderTableView = async function(modelName, config={}){
		config.hasAvatar = false;
		config.operation = [
			{label: 'เอกสารกองทุน', ID: 'pdf', icon: 'welfarefunding.PDF'}
		]
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		for(let i in table.records){
			let record = table.records[i];
			console.log(record.record);
			record.dom.pdf.onclick = async function(){
				let blob = await  GET(`welfarefunding/documentfundperyear/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
		}
	}
}