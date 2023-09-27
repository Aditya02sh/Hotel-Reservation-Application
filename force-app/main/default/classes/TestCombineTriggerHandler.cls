@isTest
public class TestCombineTriggerHandler {  
    static Profile cus = [SELECT Id FROM Profile where name='Customer' limit 1];
     static User testUser;
    static {
        testUser = new User(
            ProfileId = cus.id, 
            Username = 'aditya786sh@fmail.com',
            Email = 'aditya786sh@fmail.com',
            FirstName='Ram',
            LastName='Singh',
            Alias = 'rsing',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;
    }
    
    static testMethod void testSendEmailNotification() {
        System.runAs(testUser){
        // Create test data for Reservation__c records
        Reservation__c reservation = new Reservation__c(
            First_Name__c = 'Test First Name',
            Email__c = 'test@example.com'
            // Add other required fields here
        );

        // Insert the test reservation record
        insert reservation;

        // Create a new test context and set the reservation record to it
        Test.startTest();
        List<Reservation__c> testReservations = new List<Reservation__c>{ reservation };
        CombineTriggerHandler.sendEmailNotification(testReservations);
        Test.stopTest();
        

        // Add assertions here to verify the email sending logic
        // For example, you can use the EmailFileAssert class from the ApexMocks framework
        // to assert that an email was sent.

        // Example assertion using ApexMocks:
        // System.assertEquals(1, Test.getSentEmails().size(), 'One email should have been sent.');
    }
    }

    @isTest
    static void testHandleRoomReservations() {
         System.runAs(testUser){
        // Create test data for Room__c and Reservation__c records
        Room__c room = new Room__c(
            Name = 'Test Room',
            Price_per_Night__c = 100.0,
            Availability_Status__c = 'Available'
            // Add other required fields here
        );
        insert room;

        Reservation__c reservation1 = new Reservation__c(
            Room__c = room.Id,
            Check_in_Date__c = Date.today(),
            Check_out_Date__c = Date.today().addDays(3)
            // Add other required fields here
        );
/*
        Reservation__c reservation2 = new Reservation__c(
            Room__c = room.Id,
            Check_in_Date__c = Date.today().addDays(4),
            Check_out_Date__c = Date.today().addDays(5)
            // Add other required fields here
        );
*/
        // Insert the test reservation records
        insert new List<Reservation__c>{ reservation1 };

        // Create a new test context and set the reservation records to it
        Test.startTest();
        List<Reservation__c> testReservations = new List<Reservation__c>{ reservation1 };
        CombineTriggerHandler.handleRoomReservations(testReservations);
        Test.stopTest();

        // Add assertions here to verify the room reservation logic
        // For example, you can assert that no errors were added to the reservations.
        for (Reservation__c res : testReservations) {
            System.assertNotEquals(null, res.Id, 'Reservation should have an Id.');
            System.assertEquals( Date.today(), res.Check_in_Date__c, 'Check-in date should be null.');
            System.assertEquals( Date.today().addDays(3), res.Check_out_Date__c, 'Check-out date should be null.');
        }
         }
    }

    @isTest
    static void testSubmitApplicationForApproval() {
         System.runAs(testUser){
        // Create test data for Reservation__c records
        Reservation__c reservation = new Reservation__c(
            First_Name__c = 'Test First Name',
            Email__c = 'test@example.com'
            // Add other required fields here
        );

        // Insert the test reservation record
        insert reservation;

        // Create a new test context and set the reservation record to it
        Test.startTest();
        List<Reservation__c> testReservations = new List<Reservation__c>{ reservation };
        CombineTriggerHandler.submitApplicationForApproval(testReservations);
        Test.stopTest();

        // Add assertions here to verify the approval process submission logic
        // For example, you can assert that an approval process was initiated for the reservation.
    }
    }
}