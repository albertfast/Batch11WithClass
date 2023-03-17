import { api, LightningElement, track, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD];

export default class UpdateRecordAccount extends LightningElement {
@api recordId;
typeOptions = [];
industryOptions = [];
@track formData = {};
//1. Fetch the record from database - getRecord
@wire (getRecord, {recordId : '$recordId', fields : FIELDS})
account;
// 2. Fetch the combobox options from metadata - 
//     a. getObjectInfo
//     b. getPicklistValuesByRecordType
@wire(getObjectInfo, {objectApiName : ACCOUNT_OBJECT})
accInfo;

@wire(getPicklistValuesByRecordType, {objectApiName : ACCOUNT_OBJECT, recordTypeId : '$accInfo.data.defaultRecordTypeId'})
picklistHandler({data, error}){
    if(data){
        this.typeOptions = data.picklistFieldValues.Type.values;
        this.industryOptions = data.picklistFieldValues.Industry.values;
    }
    if(error){
        console.error(error);
    }
}
//3. Prepare data
    changeHandler(event){
        // const name = event.target.name;
        // const value = event.target.value;
        const {name, value} = event.target;
        this.formData[name] = value;
    }
    /*
4. update the record
 */
    saveAccount(){
        this.formData["Id"] = this.recordId;
        console.log("FormData"  + JSON.stringify(this.formData));
        const recordInput = {
            fields : this.formData
        };
        const REVENUE_FIELD = Number(this.formData.AnnualRevenue);
        if(REVENUE_FIELD >= 1000000){
            this.formData["Rating"] = "Hot";
            this.formData["CustomerPriority__c"] = "High"
        } else if(REVENUE_FIELD < 1000000 && REVENUE_FIELD >= 500000){
            this.formData["Rating"] = "Warm";
            this.formData["CustomerPriority__c"] = "Medium"
        }else{
            this.formData["Rating"] = "Cold";
            this.formData["CustomerPriority__c"] = "Low"
        }
        updateRecord(recordInput)
            .then(result =>{

                console.log(result);
                const toast = new ShowToastEvent({
                    title : "Success",
                    message : "Record has been updated successfully",
                    variant : "success"
                });
                this.dispatchEvent(toast);
            })
            .catch(error=>{
                console.error(error)
            })
    }
}