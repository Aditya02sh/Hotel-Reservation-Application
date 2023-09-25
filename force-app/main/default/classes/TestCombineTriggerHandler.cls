@isTest
public class TestCombineTriggerHandler {

    @isTest
    static void testCombineTriggerHandler() {
        // Create a Room__c record
        Room__c room = new Room__c(Name = 'Room 101');
        insert room;

        // Create a valid Reservation__c record
        Reservation__c validReservation = new Reservation__c(
            Room__c = room.Id,
            Check_in_Date__c = Date.today().addDays(2),
            Check_out_Date__c = Date.today().addDays(4)
        );

        // Create an invalid Reservation__c record with a past check-in date
        Reservation__c invalidReservation = new Reservation__c(
            Room__c = room.Id,
            Check_in_Date__c = Date.today().addDays(-2),
            Check_out_Date__c = Date.today().addDays(1)
        );

        Test.startTest();

        // Insert the valid reservation
        insert validReservation;

        // Attempt to insert the invalid reservation
        try {
            insert invalidReservation;
            System.assert(false, 'Inserting an invalid reservation should throw an error.');
        } catch (DmlException e) {
            // Verify that the error message is as expected
            System.assertEquals('Check-in date cannot be in the past.', e.getDmlMessage(0));
        }

        // Create a Reservation__c record with the same room overlapping with the valid reservation
        Reservation__c overlappingReservation = new Reservation__c(
            Room__c = room.Id,
            Check_in_Date__c = Date.today().addDays(3),
            Check_out_Date__c = Date.today().addDays(5)
        );

        // Attempt to insert the overlapping reservation
        try {
            insert overlappingReservation;
            System.assert(false, 'Inserting an overlapping reservation should throw an error.');
        } catch (DmlException e) {
            // Verify that the error message is as expected
            System.assertEquals('Room is already booked for the selected dates.', e.getDmlMessage(0));
        }

        Test.stopTest();
    }
}