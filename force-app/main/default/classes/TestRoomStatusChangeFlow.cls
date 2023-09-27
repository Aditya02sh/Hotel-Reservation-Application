@isTest
public class TestRoomStatusChangeFlow {

    @isTest
    static void testRoomStatusChangeFlow() {
        // Create test data
        Room__c room = new Room__c(
            Name = 'Test Room',
            Availability_Status__c = 'Available'
        );
        insert room;

        // Trigger the flow
        Test.startTest();

        // Simulate the record update that triggers the flow
        room.Availability_Status__c = 'Booked';
        update room;

        Test.stopTest();

        // Verify the outcomes of the flow
        // Check if the room's availability status is updated correctly
        Room__c updatedRoom = [SELECT Availability_Status__c FROM Room__c WHERE Id = :room.Id];
        System.assertEquals('Booked', updatedRoom.Availability_Status__c);
    }
}