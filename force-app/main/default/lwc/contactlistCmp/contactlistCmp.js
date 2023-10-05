import { LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/contactListCtrl.getContactList';

export default class ContactlistCmp extends LightningElement {

    @track accList;
    @track showAccount = false;
   // @wire (getContactList) accList;
 @wire (getContactList,{flag : '$showAccount'})
    accountList({data,error}){
        if(data){
            this.accList = data;
        } 
        else if(error){
            console.log('error # '+ error);
        }
    }

    /* Using Imperative Call
    getAccList(){
        getContactList().then(result=>{
            this.accList = result;
        })
        .catch(error=>{
            console.log('error # '+ error);
        })
    } */
    handlechange(event){
        this.showAccount = event.target.checked;
    }

}