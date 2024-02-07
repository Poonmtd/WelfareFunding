const WelfareFunding = function(){
    let object = this;

    this.page = {}
    
    this.protocol = {};
        
    this.init = async function(){
        let template = await TEMPLATE.get('welfarefunding.WelfareFunding', true);
        object.home = new DOMObject(template, {rootURL});
        object.body = document.querySelector('body');
        object.body.innerHTML = '';
        object.body.classList.add('welfarefunding');
        object.body.classList.add('frontend');
        object.body.appendChild(object.home.html);

        object.home.dom.menu.onclick = async function(){
            object.home.dom.menuBar.toggle();
        }

        object.home.dom.menuBar.onclick = async function(){
            this.hide();
        }

        object.setIcon();
        object.setTitle();
    }

}