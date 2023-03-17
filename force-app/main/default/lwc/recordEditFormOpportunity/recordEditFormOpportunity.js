import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class RecordEditFormOpportunity extends LightningElement {
    objectName =  OPP_OBJECT;
    recordId = "006Do000002jGplIAE";

    fields = {
        name: NAME_FIELD,
        account:ACCOUNT_FIELD,
        type: TYPE_FIELD,
        stage:STAGE_FIELD,
        amount:AMOUNT_FIELD,
        closeDate:CLOSEDATE_FIELD
    };

    successHandler(){
        const succesToast = new ShowToastEvent({
            title:"Success",
            message:"Opportunity has been saved successfully",
            variant:"success"
        });
        this.dispatchEvent(succesToast);
    }
}