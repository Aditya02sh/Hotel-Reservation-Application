@isTest
public class TestObjectDetailController {

    @isTest
    static void testGetCustomObjectData() {
        // Create test records
        List<Room__c> rooms = new List<Room__c>();
        rooms.add(new Room__c(Name = 'Room 1', Price_per_Night__c = 100, Availability_Status__c = 'Available'));
        rooms.add(new Room__c(Name = 'Room 2', Price_per_Night__c = 150, Availability_Status__c = 'Booked'));

        // Insert the test records
        insert rooms;

        Test.startTest();

        // Call the controller method
        List<Room__c> result = ObjectDetailController.getCustomObjectData();

        Test.stopTest();

        // Assert that the result is not null
        System.assertNotEquals(null, result);
        
        // Assert that the result contains the expected number of records
        System.assertEquals(2, result.size());

        // Assert that the fields are populated correctly
        System.assertEquals('Room 1', result[0].Name);
        System.assertEquals(100, result[0].Price_per_Night__c);
        System.assertEquals('Available', result[0].Availability_Status__c);
        System.assertEquals('Room 2', result[1].Name);
        System.assertEquals(150, result[1].Price_per_Night__c);
        System.assertEquals('Booked', result[1].Availability_Status__c);
    }
}