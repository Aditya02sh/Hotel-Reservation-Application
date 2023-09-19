public class RoomReservationHandler {
    public static void handleRoomReservations(List<Reservation__c> newReservations) {
        Set<Id> roomIds = new Set<Id>();
        Map<Id, List<Reservation__c>> roomToReservationsMap = new Map<Id, List<Reservation__c>>();

        // Collect room IDs from new reservations
        for (Reservation__c reservation : newReservations) {
            roomIds.add(reservation.Room__c);
        }

        // Query for existing reservations for these rooms
        for (Reservation__c existingReservation : [
            SELECT Id, Room__c, Check_in_Date__c, Check_out_Date__c
            FROM Reservation__c
            WHERE Room__c IN :roomIds
        ]) {
            if (!roomToReservationsMap.containsKey(existingReservation.Room__c)) {
                roomToReservationsMap.put(existingReservation.Room__c, new List<Reservation__c>());
            }
            roomToReservationsMap.get(existingReservation.Room__c).add(existingReservation);
        }

        // Check for conflicts with existing reservations
        for (Reservation__c newReservation : newReservations) {
            if (roomToReservationsMap.containsKey(newReservation.Room__c)) {
                for (Reservation__c existingReservation : roomToReservationsMap.get(newReservation.Room__c)) {
                    if (newReservation.Check_in_Date__c < existingReservation.Check_out_Date__c &&
                        newReservation.Check_out_Date__c > existingReservation.Check_in_Date__c) {
                        newReservation.addError('Room is already booked for the selected dates.');
                    }
                }
            }
        }
    }
}