import { LightningElement } from 'lwc';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import ACCOUNT_OBJECT from '@salesforce/schema/Reservation__c';

import Check_in_Date from '@salesforce/schema/Reservation__c.Check_in_Date__c';

import Check_out_Date from '@salesforce/schema/Reservation__c.Check_out_Date__c';

import Customer from '@salesforce/schema/Reservation__c.Customer__c';

import Email from '@salesforce/schema/Reservation__c.Email__c';

import First_Name from '@salesforce/schema/Reservation__c.First_Name__c';

import Reservation_Date from '@salesforce/schema/Reservation__c.Reservation_Date__c';

import Reservation_ID from '@salesforce/schema/Reservation__c.Name';

import Reservation_Status from '@salesforce/schema/Reservation__c.Reservation_Status__c';

import Room from '@salesforce/schema/Reservation__c.Room__c';

import Status from '@salesforce/schema/Reservation__c.Status__c';

import Total_Amount from '@salesforce/schema/Reservation__c.Total_Amount__c';

// import Duration from '@salesforce/schema/Reservation__c.Duration__c';

// import InternshipLevel from '@salesforce/schema/Reservation__c.InternshipLevel__c';

// import Opennings from '@salesforce/schema/Reservation__c.Opennings__c';

// import RequiredSkills from '@salesforce/schema/Reservation__c.RequiredSkills__c';

 

 

//import Email from '@salesforce/schema/Account__c.Email__c';

 

 

export default class CreateAccountRecord extends NavigationMixin(LightningElement) {

    objectApiName=ACCOUNT_OBJECT;

    fields = [First_Name, Email, Reservation_Date, Check_in_Date, Check_out_Date, Room, Customer, Reservation_Status, Reservation_ID, 
        Total_Amount, Status
    ];

 

    handleSuccess(event){

        const toastEvent=new ShowToastEvent({

            title:"Room has been Booked successfully !",

            message: "Room Booked ",

            variant: "success"

        });

        this.dispatchEvent(toastEvent);

    }
    handleCancel() {

        // Use the NavigationMixin to navigate to a different page (e.g., the list view)

        this[NavigationMixin.Navigate]({

            type: 'standard__objectPage',

            attributes: {

                objectApiName: 'Reservation__c',

                actionName: 'list'

            }

        });

    }

}