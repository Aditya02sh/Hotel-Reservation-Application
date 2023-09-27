trigger CombineTrigger on Reservation__c (before insert, after insert, before update) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            for (Reservation__c reservation : Trigger.new) {
                if (reservation.Check_in_Date__c < Date.today()) {
                    reservation.addError('Check-in date cannot be in the past.');
                }
            }
        }
    } else if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            CombineTriggerHandler.sendEmailNotification(Trigger.new);
        }
        
        if (Trigger.isInsert || Trigger.isUpdate) {
            CombineTriggerHandler.handleRoomReservations(Trigger.new);
            CombineTriggerHandler.submitApplicationForApproval(Trigger.new);
        }
    }
}