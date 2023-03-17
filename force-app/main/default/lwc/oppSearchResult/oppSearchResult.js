import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import getMatchingOpps from '@salesforce/apex/OpportunityCtrl.getMatchingOpps';

const COLUMNS = [
    { label: 'Opp Name', fieldName: 'Name', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Stage Name', fieldName: 'StageName', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
];

export default class OppSearchResult extends LightningElement {
    stageOptions;
    opps;
    columns =COLUMNS;
    error;



    @wire(getObjectInfo, {objectApiName : OPPORTUNITY_OBJECT})
    oppInfo;

    @wire(getPicklistValues, {fieldApiName :STAGE_FIELD, recordTypeId :"$oppInfo.data.defaultRecordTypeId"})
    picklistHandler({data,error}){
        if (data) {
            this.stageOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }

    changeHandler(event){
        const selectedStage = event.target.value;

        getMatchingOpps({stage :selectedStage})
            .then(result => {
                this.opps = result;
            })
            .catch(error => {
                this.error = error.body.message
            })
    }
}