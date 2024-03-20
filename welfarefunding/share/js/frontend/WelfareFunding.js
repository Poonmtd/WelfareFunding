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
        main.dom.paper3.onclick = async function(){
            await object.renderPaper3();
        }
        main.dom.paper4.onclick = async function(){
            await object.renderPaper4();
        }
        main.dom.paper5.onclick = async function(){
            await object.renderPaper5();
        }
        main.dom.paper6.onclick = async function(){
            await object.renderPaper6();
        }
        main.dom.paper7.onclick = async function(){
            await object.renderPaper7();
        }
        main.dom.paper8.onclick = async function(){
            await object.renderPaper8();
        }
        main.dom.paper9.onclick = async function(){
            await object.renderPaper9();
        }
        main.dom.paper10.onclick = async function(){
            await object.renderPaper10();
        }
        main.dom.paper11.onclick = async function(){
            await object.renderPaper11();
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

    this.renderPaper3 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper3', true);
        paper3 = new DOMObject(template);
        object.home.dom.container.html(paper3);
    }

    this.renderPaper4 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper4', true);
        paper4 = new DOMObject(template);
        object.home.dom.container.html(paper4);
    }

    this.renderPaper5 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper5', true);
        paper5 = new DOMObject(template);
        object.home.dom.container.html(paper5);
    }

    this.renderPaper6 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper6', true);
        paper6 = new DOMObject(template);
        object.home.dom.container.html(paper6);
    }

    this.renderPaper7 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper7', true);
        paper7 = new DOMObject(template);
        object.home.dom.container.html(paper7);
    }

    this.renderPaper8 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper8', true);
        paper8 = new DOMObject(template);
        object.home.dom.container.html(paper8);
    }

    this.renderPaper9 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper9', true);
        paper9 = new DOMObject(template);
        object.home.dom.container.html(paper9);
    }

    this.renderPaper10 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper10', true);
        paper10 = new DOMObject(template);
        object.home.dom.container.html(paper10);
    }

    this.renderPaper11 = async function(){
        let template = await TEMPLATE.get('welfarefunding.Paper11', true);
        paper10 = new DOMObject(template);
        object.home.dom.container.html(paper10);
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