public class CombineTriggerHandler {
    public static void sendEmailNotification(List<Reservation__c> rsvList) {
        List<Messaging.Email> emailList = new List<Messaging.Email>();

        for (Reservation__c rsv : rsvList) {
            if (rsv.Email__c != null) {
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{rsv.Email__c};
                emailMsg.setToAddresses(toAddress);
                String emailSub = 'Welcome ' + rsv.First_Name__c;
                emailMsg.setSubject(emailSub);
                String disName = 'Aditya Sharma';
                emailMsg.setSenderDisplayName(disName);

                String content = 'Hi ' + rsv.First_Name__c + '<br/><br/>' +
                    'Your room reservation has been confirmed. Thank you for choosing our service.';
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }

        Messaging.sendEmail(emailList);
    }
    
    public static void handleRoomReservations(List<Reservation__c> newReservations) {
        Set<Id> roomIds = new Set<Id>();
        Map<Id, List<Reservation__c>> roomToReservationsMap = new Map<Id, List<Reservation__c>>();

        // Collect room IDs from new reservations
        for (Reservation__c reservation : newReservations) {
            roomIds.add(reservation.Room__c);
        }

        // Query for existing reservations for these rooms
        Map<Id, List<Reservation__c>> existingReservationsMap = new Map<Id, List<Reservation__c>>();
        for (Reservation__c existingReservation : [
            SELECT Id, Room__c, Check_in_Date__c, Check_out_Date__c
            FROM Reservation__c
            WHERE Room__c IN :roomIds
        ]) {
            if (!existingReservationsMap.containsKey(existingReservation.Room__c)) {
                existingReservationsMap.put(existingReservation.Room__c, new List<Reservation__c>());
            }
            existingReservationsMap.get(existingReservation.Room__c).add(existingReservation);
        }

        // Check for conflicts with existing reservations
        for (Reservation__c newReservation : newReservations) {
            if (existingReservationsMap.containsKey(newReservation.Room__c)) {
                for (Reservation__c existingReservation : existingReservationsMap.get(newReservation.Room__c)) {
                    // Check for conflicts only when check-in and check-out dates overlap
                    if (newReservation.Check_in_Date__c < existingReservation.Check_out_Date__c &&
                        newReservation.Check_out_Date__c > existingReservation.Check_in_Date__c &&
                        newReservation.Id != null && existingReservation.Id != null &&
                        !newReservation.Id.equals(existingReservation.Id)) {
                        newReservation.addError('Room is already booked for the selected dates.');
                        break; // No need to check further, one conflict is enough
                    }
                }
            }
        }
    }

    public static void submitApplicationForApproval(List<Reservation__c> reservations) {
        List<Approval.ProcessSubmitRequest> approvalRequests = new List<Approval.ProcessSubmitRequest>();

        // Query for existing approval processes for the reservations
        Set<Id> reservationIds = new Set<Id>();
        for (Reservation__c app : reservations) {
            reservationIds.add(app.Id);
        }
        Map<Id, Id> reservationToProcessMap = new Map<Id, Id>();
        for (ProcessInstance pi : [
            SELECT Id, TargetObjectId
            FROM ProcessInstance
            WHERE TargetObjectId IN :reservationIds
        ]) {
            reservationToProcessMap.put(pi.TargetObjectId, pi.Id);
        }

        for (Reservation__c app : reservations) {
            // Check if the reservation is already in an approval process
            if (reservationToProcessMap.containsKey(app.Id)) {
                // You can handle this case, e.g., log an error or skip the record
                // Here, we're just logging a message for illustration
                System.debug('Reservation with Id ' + app.Id + ' is already in an approval process.');
            } else {
                // Create an approval request for each Reservation record
                Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
                req.setObjectId(app.Id);
                approvalRequests.add(req);
            }
        }

        // Submit the approval requests
        if (!approvalRequests.isEmpty()) {
            Approval.ProcessResult[] results = Approval.process(approvalRequests);

            // Handle any errors or check the results as needed
        }
    }
}