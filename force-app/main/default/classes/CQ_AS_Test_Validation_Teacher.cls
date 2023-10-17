@isTest
private class CQ_AS_Test_Validation_Teacher {
    static Profile pro = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    static User testUser;
    static Id permSetId;

 

    static {
        PermissionSet existingPermSet = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_AS_Common_Permission_set' LIMIT 1];
        permSetId = existingPermSet.Id;

 

        testUser = new User(
            ProfileId = pro.id, 
            Username = 'aditya0211sh@fmail.com',
            Email = 'aditya0211sh@gmail.com',
            FirstName = 'Aditya',
            LastName = 'Sharma',
            Alias = 'ashar',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;

 

        // Assign the Permission Set to the test user
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = permSetId
        );
        insert psa;
    }

 

    static testMethod void testDateCondition() {
        System.runAs(testUser){
        // Create a test record with CQ_AS_Course_Start_Date__c >= CQ_AS_Course_End_Date__c
        CQ_AS_SQX_Teacher__c testTeacher = new CQ_AS_SQX_Teacher__c(
            Name = 'Test Teacher',
            CQ_AS_Course_Start_Date__c = Date.today(),
            CQ_AS_Course_End_Date__c = Date.today().addDays(-1) // Making target date 1 day before the initiated date
        );

 

        Exception expectedException;
        try {
            insert testTeacher;
        } catch (System.DmlException e) {
            expectedException = e;
        }

 

        // Assertions
        System.assertNotEquals(null, expectedException, 'A DML Exception should have been thrown due to the validation rule.');
        System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION', expectedException.getDmlType(0).name(), 'Expected a custom validation exception.');
        System.assert(expectedException.getMessage().contains('Course Start Date should be less then Course End Date'), 'Course Start Date should be less then Course End Date');
        }
    }
}