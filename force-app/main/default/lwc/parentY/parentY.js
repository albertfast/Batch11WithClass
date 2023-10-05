import { LightningElement, track, api } from 'lwc';

export default class ParentY extends LightningElement {

    @track trackParam = "track Value";
    @api apiParam = "api Value";
    nonreactiveParam = "nonreactive Value";

    handleChangeValue(){
        this.trackParam = "Value cahanged for trackParam";
        this.apiParam = "Value cahanged for apiParam";
        //this.nonreactiveParam = "Value cahanged for nonreactiveParam";
    }
}