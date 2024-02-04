const WelfareBackend = function(main, parent) {
	AbstractPage.call(this, main, parent);

	let object = this;

	object.role = ['Welfare'];
	object.permission = [PermissionType.READ, PermissionType.WRITE, PermissionType.UPDATE, PermissionType.DROP];

	this.prepare = async function() {
	}

	this.getMenu = async function(isSubMenu) {
		object.menu = await CREATE_MENU(object.pageID, 'Welfare', 'welfarefunding.Default', isSubMenu);
		return object.menu;
	}
}