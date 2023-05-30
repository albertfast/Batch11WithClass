import { api, LightningElement } from 'lwc';

export default class DisplayResultOpp extends LightningElement {
    @api result;
    @api columns;
    @api error;
}