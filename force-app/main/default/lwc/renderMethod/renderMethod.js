import { LightningElement } from 'lwc';
import logInTemplate from './logInTemplate.html';
import signUpTemplate from './signUpTemplate.html';
import mainTemplate from './renderMethod.html';

export default class RenderMethod extends LightningElement {
    selectedButton;

    clickHandler(event){
        this.selectedButton = event.target.label;
    }

    mainHandler(){
        this.selectedButton = "mainTemplate";
    }

    render(){
        if (this.selectedButton === "LogIn") {
            return logInTemplate;
        }else if (this.selectedButton === "SignUp") {
            return signUpTemplate;
        }else{
            return mainTemplate;
        }
    }

}