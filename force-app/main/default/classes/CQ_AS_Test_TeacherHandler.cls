@isTest
private class CQ_AS_Test_TeacherHandler {
    
    Private static user testuser;
    
    // Helper method to create a user with a specific permission set
    @testSetup
    static void createUserWithPermissionSet() {
        // Retrieve the desired permission set by name
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_AS_Common_Permission_Set' LIMIT 1];
        
        // Retrieve a profile for the user (replace 'Standard User' with the actual profile name)
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1]; 
        
        // Create a new user with specified attributes
        testUser = new User(
            ProfileId = p.Id,
            Alias = 'ashar',
            Email = 'aditya0211sh@gmail.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Sharma',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'aditya0211sh@fmail.com'
        );
        
        // Insert the user and assign the permission set
        insert testUser;
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = ps.Id
        );
        insert psa;
        
        
    }
    
    @isTest static void givenTeacher_WhenUpdate_ThenAssertError() {
        // Run the test as the user with the specified permission set
        user test=[select id , username from user where UserName = 'aditya0211sh@fmail.com' LIMIT 1];
        System.runAs(test) {
            // 1. Insert a Teacher record with 'In progress' status
            CQ_AS_SQX_Teacher__c testTeacher = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'In progress');
            insert testTeacher;
            
            // 2. Try updating the Teacher's Course status to 'Completed' without an associated Student having a non-empty Marksheet
            
            testTeacher.CQ_AS_Course_Status__c = 'Completed';
            Database.SaveResult result = Database.update(testTeacher, false);
            
            System.assert(!result.isSuccess(), 'Expected error when updating the Teacher status to Completed without any Student having a non-empty Marksheet');
            
            // Insert a Student associated with the Teacher and with a non-empty Marksheet
            CQ_AS_SQX_Student__c testStudent = new CQ_AS_SQX_Student__c(CQ_AS_SQX_Teacher_Lookup__c = testTeacher.Id, CQ_AS_Marksheet__c = 'Test Marksheet');
            insert testStudent;
            
            // Try updating the Teacher's Course status to 'Completed' again with the associated Student having a non-empty Marksheet
            testTeacher.CQ_AS_Course_Status__c = 'Completed';
            update testTeacher;
            
            // 3. Insert another Teacher record with 'Closed' status
            CQ_AS_SQX_Teacher__c closedTeacher = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'Closed');
            insert closedTeacher;
            
            // Try updating the closed Teacher
            closedTeacher.CQ_AS_Course_Status__c = 'Completed';
            result = Database.update(closedTeacher, false);
            System.assert(!result.isSuccess(), 'Expected error when updating a Teacher with a Course status of Closed');
            
            // Ensure the Teacher has not been updated
            CQ_AS_SQX_Teacher__c refreshedTeacher = [SELECT CQ_AS_Course_Status__c FROM CQ_AS_SQX_Teacher__c WHERE Id = :closedTeacher.Id LIMIT 1];
            System.assertEquals('Closed', refreshedTeacher.CQ_AS_Course_Status__c);
        }
    }
}