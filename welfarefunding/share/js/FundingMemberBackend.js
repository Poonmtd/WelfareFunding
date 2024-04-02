const FundingMemberBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;
	this.title = 'Member';
	this.model = "User";
	this.pageNumber = 1;
	this.limit = 10;
	this.filter = {};

	object.role = ['FundingMember'];
	// object.restURL = 'user';

	this.render = async function(config) {
		AbstractPage.prototype.render.call(this, config);
		await object.renderUser(object.limit);
	}

	this.renderState = async function(state) {
		if (state.state == 'form'){
			let config = {
				isSetState: false,
				data: state.data,
				inputs: state.inputs,
				isView: state.isView
			};
			await object.renderView('User', config);
		}
	}

	this.getData = async function(limit){
		await object.renderUser(limit);
	}

	this.renderView = async function(modelName, config = {}, viewType='Form') {
		if(config.data != undefined){
			delete config.data.localize;
			config.data = await main.protocol.user.getUserByID({id: config.data.id});
		}
		let view = await AbstractPage.prototype.renderView.call(this, modelName, config, viewType);
		console.log(view.id);
		view.onSubmit = async function() {
			let result = await AbstractPage.prototype.submit.call(this, view);
			if(!result.isPass) return;
			let data = result.data;
			if (view.id != undefined) {
				if (data.passwordHash.length > 0 || data.confirm_passwordHash.length > 0) {
					if (data.passwordHash != data.confirm_passwordHash) {
						view.dom.passwordHash.classList.add('error');
						view.dom.confirm_passwordHash.classList.add('error');
						return;
					} else {
						view.dom.passwordHash.classList.remove('error');
						view.dom.confirm_passwordHash.classList.remove('error');
					}
				}
				data.id = view.id;
			}
			delete data.avatar;
			let formData = result.file;
			// if(view.dom.avatar.files.length) formData = result.file;
			result.data.avatarRemoved = view.dom.avatar.removed;
			formData.append('data', JSON.stringify(data));
			console.log(data);
			let handle = ('id' in data) ? main.protocol.user.update : main.protocol.user.insert;
			let response = await handle(formData);
			if (response.isSuccess) view.close();
		}
	}

	this.renderUser = async function(limit = 10){
		object.filter.isDrop = 0;
		object.limit = limit;
		let data = {
			pageNumber: object.pageNumber,
			limit: limit,
			data : object.filter
		}
		let result = await main.protocol.user.getAllUser(data);
		let option = {
			count: result.count,
			hasView: true,
		}
		// วิธีเพิ่มเอกสาร
		option.operation = [
			{label: 'PDF', ID: 'pdf', icon: 'welfarefunding.PDF'}
		];
		let table = await object.renderTableView(object.model, option, main.tableViewType);
		// if(table.dom.thead && table.dom.thead.salaryList_th){
		// 	table.dom.thead.salaryList_th.style.width = '0';
		// }
		table.onCreateRecord = async function(record) {
			record.dom.pdf.onclick = async function(){
				let blob = await GET(`welfarefunding/documentmember/by/id/get/${record.record.id}`, undefined, 'blob');
				await OPEN_FILE(blob);
			}
		}
		await table.createMultipleRecord(result.data);
	}

	this.delete = async function(tag) {
		await main.protocol.user.dropUser(tag.id);
		RENDER_STATE();
	}

	this.getFile = async function(formData, fileInput, name){
		for(let file of fileInput.files){
			formData.append(name, file);
		}
	}

}