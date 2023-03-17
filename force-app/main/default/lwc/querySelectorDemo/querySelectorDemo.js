import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {
    fruits = ["Banana", "Apple", "Strawberry", "Orange"];
    clickHandler(){
        //h1 - querySelector demo

        const h1elem = this.template.querySelector("h1");
        console.log(h1elem.innerText);
        h1elem.style.color = "#f7f707";
        h1elem.style.backgroundColor = "#f70707";
        h1elem.style.border = "2px solid #0f0f0f";

        // p - query Selector demo

        const pelem = this.template.querySelector("p");
        console.log(pelem.innerText);
        pelem.style.color = "#2c047d";
        pelem.style.backgroundColor = "#d6d3c1";
        pelem.style.border = "2px solid #f70505";

        //querySelectorAll demo

        const divElems = this.template.querySelectorAll("div.child");
        divElems.forEach(item => {
            console.log(item.innerText);
            item.style.color = "blue";
            item.style.backgroundColor = "yellow";
            item.style.border = "2px solid #f70505";
            item.setAttribute("class", "slds-align_absolute-center");
        })
        
        
        const buttonElem = this.template.querySelector("lightning-button");
        buttonElem.label = "Don't Click Again";
        buttonElem.variant = "destructive";
        buttonElem.setAttribute("class", "slds-align_absolute-center");


    }
}