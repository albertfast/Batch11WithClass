import { LightningElement, wire } from 'lwc';


columns = [
    {label: 'Contact Name', fieldName: 'LastName'},
    {label:'Email', fieldName:'Email'}
];

export default class ContactListLWC extends LightningElement {
    data = [];
    columns = columns;

  
}