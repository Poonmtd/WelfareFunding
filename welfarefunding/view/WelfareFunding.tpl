<script>
	let main;
	let LANGUAGE = 'en';
	document.addEventListener("DOMContentLoaded", function(event) {
		async function startPage() {
			TEMPLATE = {};
			TEMPLATE.get = GET_TEMPLATE;
			main = new WelfareFunding();
			await main.init();
		}
		startPage();
	});
</script>