@isTest
public class CheckInCheckOutDateValidationTest {

    @isTest
    static void testValidReservation() {
        // Create a test record with valid dates (check-in before check-out)
        Reservation__c validReservation = new Reservation__c(
            Check_in_Date__c = Date.today().addDays(2),   // Future date
            Check_out_Date__c = Date.today().addDays(4)  // Future date
        );

        // Attempt to insert the valid reservation
        Test.startTest();
        insert validReservation;
        Test.stopTest();

        // Verify that no error was thrown
        System.assertEquals(null, validReservation.Check_in_Date__c);
    }

    @isTest
    static void testInvalidReservation() {
        // Create a test record with invalid dates (check-in after check-out)
        Reservation__c invalidReservation = new Reservation__c(
            Check_in_Date__c = Date.today().addDays(5),   // Future date
            Check_out_Date__c = Date.today().addDays(3)  // Past date (violates the validation rule)
        );

        // Attempt to insert the invalid reservation
        Test.startTest();
        try {
            insert invalidReservation;
            // If the validation rule is correctly implemented, this line should not be reached
            System.assert(false, 'Inserting a reservation with invalid dates should throw an error.');
        } catch (DmlException e) {
            // Verify that the error message is as expected
            System.assertEquals('Check-in Date cannot be greater than Check-out Date.', e.getDmlMessage(0));
        }
        Test.stopTest();
    }
}