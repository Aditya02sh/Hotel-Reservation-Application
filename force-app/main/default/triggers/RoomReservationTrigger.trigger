trigger RoomReservationTrigger on Reservation__c (before insert) {
    RoomReservationHandler.handleRoomReservations(Trigger.new);
}