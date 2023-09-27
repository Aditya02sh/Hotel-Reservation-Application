public with sharing class ObjectDetailController {

    @AuraEnabled(cacheable=true)

    public static List<Room__c> getCustomObjectData() {

        return [SELECT Id, Name,Price_per_Night__c,Availability_Status__c FROM Room__c];

    }

}