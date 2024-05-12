const WelfareApplianceBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'เบิกสวัสดิการ';
	this.model = "WelfareAppliance";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['Welfare'];
	object.restURL = 'welfarefunding/welfareappliance';

	// this.renderTableView = async function(modelName, config = {}){
	// 	config.hasAvatar = false;
	// 	await AbstractPage.prototype.renderTable.call(this, modelName, config);
	// }

	// this.getData = async function(limit){
	// 	await object.renderUser(limit);
	// }

	this.renderView = async function(modelName,config={}){
		// this.currentTag = {};
		// if(config.data){
		// 	config.data = await object.protocol.history.getByID(config.data.id);
		// }
		let form = await AbstractPage.prototype.renderView.call(this,modelName,config);
		form.dom.member.onchange = async function(){
			let value = this.currentValue;
			console.log(value)
			let response = await POST('welfarefunding/welfarecondition/option/get', value);
			if(response.isSuccess) object.setWelfareTypeOption(form, response.result);

			// let value = this.value;
			// let option = await POST('/welfarefunding/welfarecondition/option',{id: value});
			// form.dom.welfareCondition.appen(`<option value="${option[i].id}">${option[i].name}</option>`)
		}
	}

	this.setWelfareTypeOption = async function(form, condition){
		form.dom.welfareType.html('<option value="-1" localize>None</option>');
		for(let i in condition){
			form.dom.welfareType.append(`<option value="${condition[i].value}">${condition[i].label}</option>`);
		}
	}

	// this.renderUser = async function(limit = 10){
	// 	object.limit = limit;
	// 	let option = {
	// 		hasAvatar: false,
	// 		hasView: true,
	// 	}
	// 	option.operation = [
	// 		{label: 'PDF', ID: 'pdf', icon: 'welfarefunding.PDF'},
	// 	];
	// 	table.onCreateRecord = async function(record) {
	// 		record.dom.pdf.onclick = async function(){
	// 			let blob = await GET(`welfarefunding/documentmember/by/id/get/${record.record.id}`, undefined, 'blob');
	// 			await OPEN_FILE(blob);
	// 		}
	// 	}
	// }

	this.renderTableView = async function(modelName, config = {}){
		config.hasAvatar = false;
		config.operation = [
			{label: 'ใบเบิกสวัสดิการ', ID: 'pdf', icon: 'welfarefunding.PDF'}
		]
		let table = await AbstractPage.prototype.renderTableView.call(this,modelName,config, 'Table');
		for(let i in table.records){
			let record = table.records[i];
			record.dom.pdf.onclick = async function(){
				let blob = await GET(`welfarefunding/documentappliance/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
		}
		// table.dom.member.onchange = async function(){
		// 	let value = this.currentValue;
		// 	console.log(value)
		// 	let response = await POST('welfarefunding/welfarecondition/option/get', value);
		// 	if(response.isSuccess) object.setWelfareTypeOption(form, response.result);
		// }
	}
}