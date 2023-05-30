import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    country;
    //showContentTr;

    changeHandler(event){
        this.country = event.target.value;      
    }
    get showContent(){
        if(this.country === "USA"){
            return true;
        }
        else{
            return false;
        }
    }
}



// else if(this.country === "Turkey"){
 //           this.showContentTr = true;
 //           this.showContent = false;
  //      }