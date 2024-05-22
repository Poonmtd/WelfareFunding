const BudgetFundBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'งบประมาณ';
	this.model = "BudgetFund";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Audit'];
	object.restURL = 'welfarefunding/budgetfund';

	this.initJS = async function(){
		object.protocol = {};
		await LOAD_JS_EXTENSION('welfarefunding', 'protocol/BudgetFundProtocol.js');

		object.protocol.budgetFund = new BudgetFundProtocol(main);

		await getENUM();
		async function getENUM(){
			let ENUM = await GET('welfarefunding/budgetfund/enum/get');
			if(ENUM){
				for(let i in ENUM.result){
					if(window[i]) continue;
					window[i] = ENUM.result[i];
				}
			}
		}
	}

	this.getData = async function(limit = 10){
		object.limit = limit;
		let data = {
			pageNumber: object.pageNumber,
			limit: limit,
			data : object.filter
		}
		let result = await object.protocol.budgetFund.getAll(data);
		let option = {
			count: result.count,
			hasAvatar: false,
			hasView: true
		}
		for(let i of result.data){
			console.log(i.budgetStatus);
			console.log(BUDGET_STATUS_COLOR);
			console.log(BUDGET_STATUS_COLOR[i.budgetStatus]);
			i.statusRecord = {};
			i.statusRecord.color = BUDGET_STATUS_COLOR[i.budgetStatus];
			i.statusRecord.label = BUDGET_STATUS_LABEL[i.budgetStatus];
		}
		let inputs = await object.getInputData(object.model);
		option.inputs = inputs;		
		option.inputs = option.inputs.concat(await object.getInputConfig([{
				'typeName': 'Status',
				'columnName': 'statusRecord',
				'label': 'Status', 
				'isTable': true,
				'order': "99.0"
			}
		]));
		option.data = result.data;
		await object.renderTableView(object.model, option);
	}

	this.renderTableView = async function(modelName, config = {}){
		config.operation = [
			{label: 'ใบเสร็จรับเงิน', ID: 'pdf', icon: 'welfarefunding.PDF'},
			{label: 'แบบเสนอขอรับเงินสนับสนุน', ID: 'budget', icon: 'welfarefunding.PDF'}
		];
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		for(let i in table.records){
			let record = table.records[i];
			console.log(record.record);
			record.dom.pdf.onclick = async function(){
				let blob = await GET(`welfarefunding/documentbudget/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
			record.dom.budget.onclick = async function(){
				let blob = await GET(`welfarefunding/requestbudget/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
			// console.log(record.record.statusRecord);
			console.log("-");
			console.log(record.record.budgetType);
			//ON PROCESS
			if(record.record.statusRecord.color == "YELLOW"){
				record.dom.pdf.remove();
			}
			//CANCEL
			else if(record.record.statusRecord.color == "RED"){
				record.dom.edit.remove();
				record.dom.pdf.remove();
				record.dom.budget.remove();
			}
			//SUCCESS
			else if(record.record.statusRecord.color == "GREEN"){
				record.dom.edit.remove();
			}
			//DRAFT
			else if(record.record.statusRecord.color == "GRAY"){
				record.dom.pdf.remove();
			}
			// if(record.record.documentStatus == BUDGET_STATUS.RELEASE){
			// 	record.dom.edit.remove();
			// 	record.dom.delete.remove();				
			// }
		}
	}
}