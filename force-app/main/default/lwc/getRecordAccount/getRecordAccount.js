import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import TYPE_FIELD from '@salesforce/schema/Account.Type';

const FIELDS = [NAME_FIELD, ANNUALREVENUE_FIELD, INDUSTRY_FIELD, RATING_FIELD,TYPE_FIELD];

export default class GetRecordAccount extends LightningElement {
    recordId = '001Do000003DLa7IAG';

    name;
    revenue;
    industry;
    rating;
    type;

    @wire (getRecord, {recordId: '$recordId', fields:FIELDS})
    recordHandler({data,error}){
        if(data){
            console.log('Account Data ==> ', data);
            this.name= getFieldValue(data,NAME_FIELD);
            this.revenue=getFieldDisplayValue(data,ANNUALREVENUE_FIELD);
            this.industry= getFieldValue(data, INDUSTRY_FIELD);
            this.rating= getFieldDisplayValue(data,RATING_FIELD);
            this.type= getFieldValue(data,TYPE_FIELD);

        }
        if(error){
            console.error(error);
        }
    }
    
}