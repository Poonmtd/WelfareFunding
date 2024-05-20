const FundDocumentBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'เอกสารกองทุนประจำปี';
	this.model = "FundDocument";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundDocument'];
	object.restURL = 'welfarefunding/funddocument';

	this.renderTableView = async function(modelName, config={}){
		config.hasAvatar = false;
		config.operation = [
			{label: 'เอกสารกองทุน', ID: 'pdf', icon: 'welfarefunding.PDF'},
			{label: 'ภาษี', ID: 'tax', icon: 'welfarefunding.PDF'}
			// {label: 'ลองคำนวณ', ID: 'calculate', icon: 'welfarefunding.PDF'},
			// {label: 'แบบประสงค์ขอโอน', ID: 'transfer', icon: 'welfarefunding.PDF'},
			// {label: 'หนังสือร้องเรียน', ID: 'complaint', icon: 'welfarefunding.PDF'},
			// {label: 'แบบเสนอขอรับเงินสนับสนุน', ID: 'requestbudget', icon: 'welfarefunding.PDF'}
		]
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		for(let i in table.records){
			let record = table.records[i];
			console.log(record.record);
			record.dom.pdf.onclick = async function(){
				let blob = await  GET(`welfarefunding/documentfundperyear/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
			record.dom.tax.onclick = async function(){
				let blob = await  GET(`welfarefunding/taxdocument/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
			// record.dom.calculate.onclick = async function(){
			// 	let blob = await GET(`welfarefunding/testcalculate/by/id/get/${record.record.id}`, undefined, 'blob');
			// 	await OPEN_FILE(blob);
			// }
			// record.dom.transfer.onclick = async function(){
			// 	let blob = await GET(`welfarefunding/transferrequestform/by/id/get/${record.record.id}`, undefined, 'blob');
			// 	await OPEN_FILE(blob);
			// }
			// record.dom.complaint.onclick = async function(){
			// 	let blob = await GET(`welfarefunding/complaintletter/by/id/get/${record.record.id}`, undefined, 'blob');
			// 	await OPEN_FILE(blob);
			// }
			// record.dom.requestbudget.onclick = async function(){
			// 	let blob = await GET(`welfarefunding/requestbudget/by/id/get/${record.record.id}`, undefined, 'blob')
			// 	await OPEN_FILE(blob);
			// }
		}
	}
}