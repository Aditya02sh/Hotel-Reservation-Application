trigger PastDateTrigger on Reservation__c (before insert, before update) {
    for (Reservation__c reservation : Trigger.new) {
        if (reservation.Check_in_Date__c < Date.today()) {
            reservation.addError('Check-in date cannot be in the past.');
        }
    }
}