import { LightningElement, wire } from 'lwc';
import {publish,MessageContext} from 'lightning/messageService';
import COUNTER_FILE from '@salesforce/messageChannel/updatecounter__c';
export default class Demopub extends LightningElement {

    @wire(MessageContext)
    messageContext;

    handleAddition(){
        const payload ={
            operator : 'Add',
            constant :1
        };
        publish(this.messageContext,COUNTER_FILE,payload);
    }
    handleSubtraction(){
        const payload ={
            operator : 'Subtrack',
            constant :1
        };
        publish(this.messageContext,COUNTER_FILE,payload);
    }
    handleMultiply(){
        const payload ={
            operator : 'Multiply',
            constant :2
        };
        publish(this.messageContext,COUNTER_FILE,payload);
    }
}