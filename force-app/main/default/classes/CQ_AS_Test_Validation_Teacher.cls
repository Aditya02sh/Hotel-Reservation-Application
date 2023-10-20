@isTest
private class CQ_AS_Test_Validation_Teacher {
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
            ProfileId = p.id, 
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
        
        // Insert the user and assign the permission set
        insert testUser;
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = ps.Id
        );
        insert psa;
        
          
    }
    
    // Test method to validate a custom date validation rule for Teacher objects
    @isTest static void givenStartDate_WhenLessThanEndDate_ThenNotInsert() {
        user test=[select id , username from user where UserName = 'aditya0211sh@fmail.com' LIMIT 1];
        System.runAs(test) {
            // Create a test Teacher record with an intentionally invalid date configuration
            CQ_AS_SQX_Teacher__c testTeacher = new CQ_AS_SQX_Teacher__c(
                Name = 'Test Restaurant',
                CQ_AS_Course_Start_Date__c = Date.today(),
                CQ_AS_Course_End_Date__c = Date.today().addDays(-1) // Making target date 1 day before the initiated date
            );
            
            // Define an exception variable to capture the expected validation exception
          
            Database.saveresult Result=Database.insert(testTeacher,false);
          
            System.assert(!Result.isSuccess());
        }
    }
}