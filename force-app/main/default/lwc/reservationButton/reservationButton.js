// RedirectButton.js

import { LightningElement } from 'lwc';

import { NavigationMixin } from 'lightning/navigation';

 

export default class RedirectButton extends NavigationMixin(LightningElement) {

    handleButtonClick() {

        // Define the target page's URL or PageReference

        const pageReference = {

            type: 'standard__webPage',

            attributes: {

                url: 'https://cunning-raccoon-r1a9bv-dev-ed.trailblaze.lightning.force.com/lightning/o/Reservation__c/new?count=1&nooverride=1&useRecordTypeCheck=1&navigationLocation=LIST_VIEW&uid=169405942933388599&backgroundContext=%2Flightning%2Fo%2FReservation__c%2Flist%3FfilterName%3DRecent' // Replace with the actual target page URL

            }

        };

 

        // Navigate to the target page

        this[NavigationMixin.Navigate](pageReference);

    }

}