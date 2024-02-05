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
		let table = await object.renderTableView(object.model, option, main.tableViewType);
		await table.createMultipleRecord(result.data);
	}

	this.renderTableView = async function(modelName, config) {
		let table = await AbstractPage.prototype.renderTable.call(this, modelName, config);
		table.onCreateRecord = async function(record){
			// if(record.record.documentStatus == BUDGET_STATUS.RELEASE){
			// 	record.dom.edit.remove();
			// 	record.dom.delete.remove();				
			// }
		}
		return table;
	}

}