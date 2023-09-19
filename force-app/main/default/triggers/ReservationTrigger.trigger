trigger ReservationTrigger on Reservation__c (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        ResrvationTriggerHandler.sendEmailNotification(Trigger.new);
    }

}