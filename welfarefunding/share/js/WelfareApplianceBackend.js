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
}