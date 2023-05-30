import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELDS from '@salesforce/schema/Account.Name';
import TYPE_FIELDS from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELDS from '@salesforce/schema/Account.Industry';
import REVENUE_FIELDS from '@salesforce/schema/Account.AnnualRevenue';
import RATING_FIELDS from '@salesforce/schema/Account.Rating';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class RecordFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    accFields = [NAME_FIELDS, TYPE_FIELDS, REVENUE_FIELDS, INDUSTRY_FIELDS, RATING_FIELDS];
    recordId = "001Do000008VmZHIA0";

    succesHandler(){
        const succesEvent = new ShowToastEvent ({
            title: "Success",
            message: "Account record has been saved successfully!",
            variant : "success"
        });
        this.dispatchEvent(succesEvent);
    }

    errorHandler(){
        const errorEvent = new ShowToastEvent ({
            title: "Error",
            message: "Account error has been saved successfully!",
            variant : "error"
        });
        this.dispatchEvent(errorEvent);
    }

    
}