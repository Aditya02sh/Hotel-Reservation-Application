@isTest
public class CQ_AS_Test_StudentHandler {
    
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
            UserName = 'aditya0211sh@fmail.com'
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
    
    
    @isTest
    static void testBeforeChange() {
        System.runas(createUserWithPermissionSet()){
            // Insert a Teacher record
            CQ_AS_SQX_Teacher__c teacher = new CQ_AS_SQX_Teacher__c(Name='abcd', CQ_AS_Course_End_Date__c=system.today(),CQ_AS_Course_Status__c = 'In progress');
            insert teacher;
            
            CQ_AS_SQX_Teacher__c teacher2 = new CQ_AS_SQX_Teacher__c(Name='abdfdcd', CQ_AS_Course_End_Date__c=system.today(),CQ_AS_Course_Status__c = 'Completed');
            insert teacher2;
            
            // Insert a Student record associated with the above teacher
            CQ_AS_SQX_Student__c student = new CQ_AS_SQX_Student__c(Name='TestStudent',CQ_AS_SQX_Teacher_Lookup__c = teacher.Id);
            insert student;
            
            // Update the Student record
            Test.startTest();
            
            student.CQ_AS_SQX_Teacher_Lookup__c = teacher2.Id;
            Database.SaveResult result = Database.update(student, false);
            Test.stopTest();
            
            // Assert that an error is thrown because the course status is Completed or Closed and changing the parent
            System.assert(!result.isSuccess());
            System.assert(result.getErrors().size() > 0);
            System.assertEquals('Since the course is done you cannot edit these records!', result.getErrors()[0].getMessage());
        }
    }
    
    @isTest
    static void testAfterMethod() {
        System.runas(createUserWithPermissionSet()){
            // Insert a Teacher record
            CQ_AS_SQX_Teacher__c teacher = new CQ_AS_SQX_Teacher__c(Name='abcsdd', CQ_AS_Course_End_Date__c=system.today(),CQ_AS_Course_Status__c = 'In progress');
            insert teacher;
            
            // Insert a Student record associated with the above coach
            CQ_AS_SQX_Student__c student = new CQ_AS_SQX_Student__c(Name='Test Student2',CQ_AS_SQX_Teacher_Lookup__c = teacher.Id);
            insert student;
            
            Test.startTest();
            
            // Call the after method
            CQ_AS_Student_TriggerHandler.handleAfterMethod(new List<CQ_AS_SQX_Student__c> { student });
            
            Test.stopTest();
            
            // Assert that the Teacher record's CQ_AS_Child_Record__c field is updated to 'Yes'
            teacher = [SELECT 	CQ_AS_Child_Record__c FROM CQ_AS_SQX_Teacher__c WHERE Id = :teacher.Id LIMIT 1];
            System.assertEquals('Yes', teacher.CQ_AS_Child_Record__c);
        }
    }
}