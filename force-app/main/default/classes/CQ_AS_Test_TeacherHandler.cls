@isTest
private class CQ_AS_Test_TeacherHandler {
    
        private static User createUserWithPermissionSet() {
        
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_AS_Common_Permission_Set' LIMIT 1];
        
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        
        User u = new User(
            ProfileId = p.Id,
            Alias = 'ashar',
            Email = 'aditya0211sh@gmail.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Sharma',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'aditya0211sh@gmail.com'
        );
        insert u;
        
        // Assign the permission set to the user
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = u.Id,
            PermissionSetId = ps.Id
        );
        insert psa;
        
        return u;
    }

    @isTest static void test_handleBeforeUpdate() {

        // 1. Insert a teacher record with 'In progress' status
        CQ_AS_SQX_Teacher__c testTeacher = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'In progress');
        insert testTeacher;

 

        // 2. Try updating the teacher's course status to 'Completed' without an associated student having a non-empty marksheet
        Test.startTest();
        testTeacher.CQ_AS_Course_Status__c = 'Completed';
        Database.SaveResult result = Database.update(testTeacher, false);
        Test.stopTest();
        System.assert(!result.isSuccess(), 'Expected error when updating the teacher status to Completed without any student having a non-empty marksheet');

 

        // Insert a student associated with the teacher and with a non-empty marksheet
        CQ_AS_SQX_Student__c testStudent = new CQ_AS_SQX_Student__c(CQ_AS_SQX_Teacher_Lookup__c = testTeacher.Id, CQ_AS_Marksheet__c = 'Test Marksheet');
        insert testStudent;

 

        // Try updating the teacher's course status to 'Completed' again with the associated student having a non-empty marksheet
        testTeacher.CQ_AS_Course_Status__c = 'Completed';
        update testTeacher;

 

        // 3. Insert another teacher record with 'Closed' status
        CQ_AS_SQX_Teacher__c closedTeacher = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'Closed');
        insert closedTeacher;

 

        // Try updating the closed teacher
        closedTeacher.CQ_AS_Course_Status__c = 'Completed';
        result = Database.update(closedTeacher, false);
        System.assert(!result.isSuccess(), 'Expected error when updating a teacher with a course status of Closed');

 

        // Ensure the teacher has not been updated
        CQ_AS_SQX_Teacher__c refreshedTeacher = [SELECT CQ_AS_Course_Status__c FROM CQ_AS_SQX_Teacher__c WHERE Id = :closedTeacher.Id LIMIT 1];
        System.assertEquals('Closed', refreshedTeacher.CQ_AS_Course_Status__c);
    }
}