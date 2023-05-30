import { LightningElement } from 'lwc';

export default class GrandParentComp extends LightningElement {
message;
    showHandler(event){
        console.log("Recieved show event at grand parent comp");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
        this.message = event.detail;
    }
}