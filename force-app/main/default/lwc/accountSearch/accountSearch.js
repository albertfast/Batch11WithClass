import { LightningElement } from 'lwc';

export default class AccountSearch extends LightningElement {
    searchText='';

    constructor(){
        super();
        this.template.addEventListener('searchaccountcontact', this.searchAccountContactHandler);
    }
    searchAccountContactHandler(event){
        console.log('Event received in AccountSearch:', event.detail);
        this.searchText = event.detail;
    }
    
    
}