import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {
  @track  location = {
        city : 'San Francisco',
        country : 'U.S.'
    };

    changeHandler(event){
        this.location.city=event.target.value;
    }
}