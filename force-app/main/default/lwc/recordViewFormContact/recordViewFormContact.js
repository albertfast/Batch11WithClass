import { api, LightningElement } from 'lwc';
import NAME_FIELDS from '@salesforce/schema/Contact.Name';
import ACCNAME_FIELDS from '@salesforce/schema/Contact.AccountId';
import PHONE_FIELDS from '@salesforce/schema/Contact.Phone';
import LEADSOURCE_FIELDS from '@salesforce/schema/Contact.LeadSource';
import DEPARTMENT_FIELDS from '@salesforce/schema/Contact.Department';
import BIRTHDATE_FIELDS from '@salesforce/schema/Contact.Birthdate';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class RecordViewFormContact extends LightningElement {
    objectName = CONTACT_OBJECT;
    @api recordId;

    fields = {
        Name:NAME_FIELDS,
        AccName:ACCNAME_FIELDS,
        Phone:PHONE_FIELDS,
        Lead:LEADSOURCE_FIELDS,
        Department:DEPARTMENT_FIELDS,
        BirthDate:BIRTHDATE_FIELDS
        
    }
}