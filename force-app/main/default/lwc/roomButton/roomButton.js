// RedirectButton.js

import { LightningElement } from 'lwc';

import { NavigationMixin } from 'lightning/navigation';

 

export default class RedirectButton extends NavigationMixin(LightningElement) {

    handleButtonClick() {

        // Define the target page's URL or PageReference

        const pageReference = {

            type: 'standard__webPage',

            attributes: {

                url: 'https://cunning-raccoon-r1a9bv-dev-ed.trailblaze.lightning.force.com/lightning/o/Room__c/list?filterName=Recent' // Replace with the actual target page URL

            }

        };

 

        // Navigate to the target page

        this[NavigationMixin.Navigate](pageReference);

    }

}