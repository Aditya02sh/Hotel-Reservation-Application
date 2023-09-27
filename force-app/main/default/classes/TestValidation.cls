@isTest
public class TestValidation {

    @isTest
    static void testValidationRule() {
        // Create a test record that violates the validation rule
        Reservation__c reservation = new Reservation__c(
            Check_in_Date__c = Date.today(),
            Check_out_Date__c = Date.today().addDays(-1)  // Check-out date before check-in date
            // Add other required fields here
        );

        // Insert the test record
        Boolean hasValidationError = false;
        try {
            insert reservation;
        } catch (DmlException e) {
            for (Integer i = 0; i < e.getNumDml(); i++) {
                if (e.getDmlMessage(i).contains('Check-in date must be before')) {
                    hasValidationError = true;
                    break;
                }
            }
        }

        // Check if a validation error occurred
        System.assert(hasValidationError, 'Validation rule did not enforce Check_in_Date__c >= Check_out_Date__c');

        // Create a test record that does not violate the validation rule
        Reservation__c validReservation = new Reservation__c(
            Check_in_Date__c = Date.today(),
            Check_out_Date__c = Date.today().addDays(1)  // Check-out date after check-in date
            // Add other required fields here
        );

        // Insert the valid test record
        insert validReservation;
        // If the insert succeeds, it means the validation rule passed

        // You can add more test scenarios as needed to cover other cases
    }
}