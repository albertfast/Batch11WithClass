import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {
    fruits = ["Apple", "Cherry", "Mango", "Orange"];

    num1=10;
    num2=20;

    get sum(){
        let result = this.num1 + this.num2;
        return result;
    }
   get  firstFruit(){
        return this.fruits[0];
    }
    get  secondFruit(){
        return this.fruits[1];
    }

}