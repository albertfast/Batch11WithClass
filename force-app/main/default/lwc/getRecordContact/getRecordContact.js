import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.Account.Name';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class GetRecordContact extends LightningElement {
    recordId = '003Do000002OmPgIAK';

    firstName;
    lastName;
    accountName;
    department;
    leadSource;
    email;

    @wire (getRecord, {recordId : '$recordId', layoutTypes: ['Full']})
    recordHandler({data,error}){
        if (data) {
            console.log('Contact Data ==> ', data);
             /* Approach-1
            this.firstName=data.fields.FirstName.value;
            this.lastName=data.fields.LastName.value;
            this.accountName=data.fields.Account.displayValue;
            this.department=data.fields.Department.value;
            this.leadSource=data.fields.LeadSource.displayValue;
            this.email=data.fields.Email.value;
            */

            /* Approach-2 ==> We need import fields */
            this.firstName = getFieldValue(data, FIRSTNAME_FIELD);
            this.lastName = getFieldValue(data, LASTNAME_FIELD);
            this.accountName = getFieldValue(data, ACCOUNT_FIELD);
            this.department = getFieldValue(data, DEPARTMENT_FIELD);
            this.leadSource = getFieldDisplayValue(data, LEADSOURCE_FIELD);
            this.email = getFieldValue(data, EMAIL_FIELD);
        }
        if (error) {
            console.error(error);
        }
    }
}