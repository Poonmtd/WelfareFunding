const WelfareFunding = function(){
    let object = this;

    this.page = {}
    
    this.protocol = {};

    this.init = async function(){
		let template = await TEMPLATE.get('welfarefunding.WelfareFunding', true);
		object.home = new DOMObject(template);
		object.body = document.querySelector('body');
		object.body.innerHTML = '';
		object.body.classList.add('welfarefunding');
		object.body.appendChild(object.home.html);
		await object.renderPage(false);
		// await object.renderFooter();
		window.onpopstate = function(e){
			object.renderPage(isPushState = false);
		}
	}

    this.render = async function(isPushState = false){
		let template = await TEMPLATE.get('welfarefunding.WelfareFundingMain', true)
		main = new DOMObject(template);
		object.home.dom.container.html(main);
		if(isPushState) await object.pushState();
		await object.initEvent(main);
	}

    this.initEvent = async function(){
        main.dom.paper1.onclick = async function(){
			await object.renderPaper1();
		}
        // paper1:ใบสมัครสมาชิก
        main.dom.paper2.onclick = async function(){
            await object.renderPaper2();
        }
    }

    this.renderPaper1 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper1', true);
		paper1 = new DOMObject(template);
		object.home.dom.container.html(paper1);
    }

    this.renderPaper2 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper2', true);
        paper2 = new DOMObject(template);
        object.home.dom.container.html(paper2);
    }

    this.getParamsFromURL = function() {
		const params = new URLSearchParams(location.search);
		let data = {};
		let keys = params.keys();
		for (let key of keys) {
			data[key] = params.get(key);
		}
		return data;
	}

    this.renderPage = async function(isPushState = true){
		let data = object.getParamsFromURL();
		let page = data['page'];
		
		if(page == undefined){
			await object.render();
			if(isPushState) await object.pushState();
			return;
		}
		return;
	}	
        
    // this.init = async function(){
    //     let template = await TEMPLATE.get('welfarefunding.WelfareFunding', true);
    //     object.home = new DOMObject(template, {rootURL});
    //     object.body = document.querySelector('body');
    //     object.body.innerHTML = '';
    //     object.body.classList.add('welfarefunding');
    //     object.body.classList.add('frontend');
    //     object.body.appendChild(object.home.html);

    //     object.home.dom.paper1.onclick = async function(){
    //         await object.renderPaper1();
    //     }
    // }

    // this.render = async function(isPushState = false){
	// 	let template = await TEMPLATE.get('ximpleerpsite.XimpleHomepage', true)
	// 	main = new DOMObject(template);
	// 	object.home.dom.container.html(main);
	// 	if(isPushState) await object.pushState();
	// 	await object.initEvent(main);

	// 	await object.renderTestDialog(main);
	// 	main.dom.test.onclick = async function(){
	// 		main.dom.dialog.show();
	// 	}
	// }

    // this.renderPaper1 = async function(){
    //     let template = await TEMPLATE.get('welfarefunding.Paper1', true);
    //     paper1 = new DOMObject(template, {rootURL});
    //     object.home.dom.container.html(paper1);
    // }
}