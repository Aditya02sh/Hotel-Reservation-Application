@isTest
public class CQ_AS_Test_StudentHandler {
    
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
    
    @isTest
    static void givenTeacher_WhenChangeTeacher_ThenAssertError() {
        // Run the test as the user with the specified permission set
        user test=[select id , username from user where UserName = 'aditya0211sh@fmail.com' LIMIT 1];
        System.runAs(test) {
            // Insert a Teacher record with 'In progress' status
            CQ_AS_SQX_Teacher__c Teacher = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'In progress');
            insert Teacher;
            
            // Insert another Teacher record with 'Completed' status
            CQ_AS_SQX_Teacher__c Teacher2 = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'Completed');
            insert Teacher2;
            
            // Insert a Student record associated with the first Teacher
            CQ_AS_SQX_Student__c Student = new CQ_AS_SQX_Student__c(CQ_AS_SQX_Teacher_Lookup__c = Teacher.Id);
            insert Student;
            
            // Update the Student record's associated Teacher to the second Teacher
            
            Student.CQ_AS_SQX_Teacher_Lookup__c = Teacher2.Id;
            Database.SaveResult result = Database.update(Student, false);

            // Assert that an error is thrown due to changing the parent when Course status is Completed or Closed
            System.assert(!result.isSuccess());
            System.assert(result.getErrors().size() > 0);
            System.assertEquals('Since the course is done you cannot edit these records!', result.getErrors()[0].getMessage());
        }
    }
    
    @isTest
    static void givenTeacher_WhenAlterStudent_ThenAssertChildValue() {
        // Run the test as the user with the specified permission set
        user test=[select id , username from user where UserName = 'aditya0211sh@fmail.com' LIMIT 1];
        System.runAs(test) {
            // Insert a Teacher record with 'In progress' status
            CQ_AS_SQX_Teacher__c Teacher = new CQ_AS_SQX_Teacher__c(CQ_AS_Course_Status__c = 'In progress');
            insert Teacher;
            
            // Insert a Student record associated with the above Teacher
            CQ_AS_SQX_Student__c Student = new CQ_AS_SQX_Student__c(CQ_AS_SQX_Teacher_Lookup__c = Teacher.Id);
            insert Student;

            // Call the after method to handle Student updates
            CQ_AS_Student_TriggerHandler.handleAfterMethod(new List<CQ_AS_SQX_Student__c> { Student });

            // Assert that the Teacher record's CQ_AS_Child__c field is updated to 'Yes'
            Teacher = [SELECT CQ_AS_Child_Record__c FROM CQ_AS_SQX_Teacher__c WHERE Id = :Teacher.Id LIMIT 1];
            System.assertEquals('Yes', Teacher.CQ_AS_Child_Record__c);
        }
    }
}