public class ResrvationTriggerHandler {
    public static void sendEmailNotification(List<Reservation__c> rsvList){

        List<Messaging.Email> emailList = new List<Messaging.Email>();

        for(Reservation__c rsv : rsvList){
            if(rsv.Email__c != null){
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{rsv.Email__c};
                    emailMsg.setToAddresses(toAddress);
                String emailSub = 'Welcome ' + rsv.First_Name__c;
                emailMsg.setSubject(emailSub);
                String disName = 'Aditya Sharma';
                emailMsg.setSenderDisplayName(disName);

                String content = 'Hi ' + rsv.First_Name__c + '<br/><br/>'+
                    'Your room reservation has been confirmed. Thank you for choosing our service.';
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }
        Messaging.sendEmail(emailList);
    }
}