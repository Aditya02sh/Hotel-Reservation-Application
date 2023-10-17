@isTest
private class CQ_AS_Test_Teacher_AL_Flow {

    // Helper method to create a user with a specific permission set
    private static User createUserWithPermissionSet() {
        // Retrieve the desired permission set by name
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_AS_Common_Permission_Set' LIMIT 1];
        
        // Retrieve a profile for the user (replace 'Standard User' with the actual profile name)
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1]; 
        
        // Create a new user with specified attributes
        User u = new User(
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
        insert u;
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = u.Id,
            PermissionSetId = ps.Id
        );
        insert psa;
        
        return u;  // Return the created user
    }
    
    @isTest static void testAutoLaunchedFlow() {
        // Run the test as the user with the specified permission set
        System.runAs(createUserWithPermissionSet()) {
            // 1. Insert a test record without the expected updates from the Flow
            CQ_AS_SQX_Teacher__c testTeacher = new CQ_AS_SQX_Teacher__c(
                Name = 'Test Teacher'
            );
            insert testTeacher;
            
            // Set up Flow and its variables
            Flow.Interview.CQUI_AS_Set_Date_AL_Flow flow = new Flow.Interview.CQUI_AS_Set_Date_AL_Flow(
                new Map<String, Object> {
                    'InRecord' => testTeacher
                }
            );
            
            Test.startTest();
            
            // Execute the flow
            flow.start();
            
            Test.stopTest();
            
            // Retrieve the OutRecord variable from the flow
            CQ_AS_SQX_Teacher__c outTeacher = (CQ_AS_SQX_Teacher__c)flow.getVariableValue('OutRecord');
            
            // Validate the expected changes on OutRecord
            System.assertEquals(Date.today().addDays(10), outTeacher.CQ_AS_Course_End_Date__c, 'Target date on OutRecord should be 10 days ahead of the current date.');
        }
    }
}