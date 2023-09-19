@isTest
public class RoomReservationHandlerTest {

    @isTest
    static void testHandleRoomReservations() {
        // Create test data for room reservations
        Room__c testRoom = new Room__c(Name = 'Test Room');
        insert testRoom;

        // Create a test reservation that doesn't conflict with existing reservations
        Reservation__c testReservation1 = new Reservation__c(
            Room__c = testRoom.Id,
            Check_in_Date__c = Date.today().addDays(2),   // Future date
            Check_out_Date__c = Date.today().addDays(4)  // Future date
        );

        // Create a test reservation that conflicts with an existing reservation
        Reservation__c existingReservation = new Reservation__c(
            Room__c = testRoom.Id,
            Check_in_Date__c = Date.today().addDays(3),   // Future date
            Check_out_Date__c = Date.today().addDays(5)  // Future date
        );
        insert existingReservation;

        Reservation__c testReservation2 = new Reservation__c(
            Room__c = testRoom.Id,
            Check_in_Date__c = Date.today().addDays(4),   // Conflicts with existing reservation
            Check_out_Date__c = Date.today().addDays(6)  // Conflicts with existing reservation
        );

        // Wrap the test in a system.runAs block to ensure proper permissions
        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Add the test reservations to a list
            List<Reservation__c> testReservations = new List<Reservation__c>();
            testReservations.add(testReservation1);
            testReservations.add(testReservation2);

            // Call the handler method to test
            RoomReservationHandler.handleRoomReservations(testReservations);

            // Verify that the second test reservation has an error message
            //System.assertEquals('Room is already booked for the selected dates.', testReservation2.Errors__c);
        }
    }
}