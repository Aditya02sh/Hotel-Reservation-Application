@isTest
public class TestPastDateTrigger {

    @isTest
    static void testPastDateTrigger() {
        // Create a test record with a check-in date in the past (violates the trigger)
        Reservation__c invalidReservation = new Reservation__c(
            Check_in_Date__c = Date.today().addDays(-1),   // Past date (violates the trigger)
            Check_out_Date__c = Date.today().addDays(2)    // Future date
        );

        // Attempt to insert the invalid reservation
        try {
            insert invalidReservation;
            // If the trigger is correctly implemented, this line should not be reached
            System.assert(false, 'Inserting a reservation with a past check-in date should throw an error.');
        } catch (DmlException e) {
            // Verify that the error message is as expected
            System.assertEquals('Check-in date cannot be in the past.', e.getDmlMessage(0));
        }

        // Create a test record with valid dates (check-in and check-out both in the future)
        Reservation__c validReservation = new Reservation__c(
            Check_in_Date__c = Date.today().addDays(2),   // Future date
            Check_out_Date__c = Date.today().addDays(4)  // Future date
        );

        // Attempt to insert the valid reservation
        try {
            insert validReservation;
        } catch (DmlException e) {
            // If the trigger is correctly implemented, this line should not be reached
            System.assert(false, 'Inserting a reservation with valid dates should not throw an error.');
        }
    }
}