public class CQ_AS_Student_TriggerHandler {
    
    public static void handleBeforeChange(List<CQ_AS_SQX_Student__c> newStudents,Map<id,CQ_AS_SQX_Student__c> oldMap) {
        Set<Id> teacherIds = new Set<Id>();
        
        // Collect the parent teacher IDs with restricted course status
        for (CQ_AS_SQX_Student__c student : newStudents) {
            teacherIds.add(student.CQ_AS_SQX_Teacher_Lookup__c);
        }
        
        Map<Id, CQ_AS_SQX_Teacher__c> teachers = new Map<Id, CQ_AS_SQX_Teacher__c>(
            [SELECT Id, CQ_AS_Course_Status__c FROM CQ_AS_SQX_Teacher__c WHERE Id IN :teacherIds]
        );
        
        // Check if any child record is associated with a restricted parent and prevent updates
        for (CQ_AS_SQX_Student__c student : newStudents) {
            CQ_AS_SQX_Teacher__c teacher = teachers.get(student.CQ_AS_SQX_Teacher_Lookup__c);
            CQ_AS_SQX_Student__c oldStudent=oldMap.get(student.id);
            if(oldStudent.CQ_AS_SQX_Teacher_Lookup__c!=student.CQ_AS_SQX_Teacher_Lookup__c){
                teacher.addError('You cannnot change the Parent!');
            }
            if (teacher.CQ_AS_COurse_Status__c == 'Completed' || teacher.CQ_AS_Course_Status__c == 'Closed') {
                student.addError('Since the course is done you cannot edit these records!');
            }
        }
    }

    public static void handleAfterMethod(List<CQ_AS_SQX_Student__c> Students){
        
        
        Set<Id> TeacherIdsToUpdate = new Set<Id>();
        for (CQ_AS_SQX_Student__c student : Students) {
            if (student.CQ_AS_SQX_Teacher_Lookup__c != null) {
                TeacherIdsToUpdate.add(student.CQ_AS_SQX_Teacher_Lookup__c);
            }
        }
        List<CQ_AS_SQX_Teacher__c> teachersToUpdate = new List<CQ_AS_SQX_Teacher__c>();
        for (Id teacherId : TeacherIdsToUpdate) {
            Integer relatedStudentCount = [
                SELECT COUNT()
                FROM CQ_AS_SQX_Student__c
                WHERE CQ_AS_SQX_Teacher_Lookup__c = :teacherId
            ];
            CQ_AS_SQX_Teacher__c teacher = new CQ_AS_SQX_Teacher__c(Id = teacherId);
            teacher.CQ_AS_Child_Record__c = (relatedStudentCount > 0) ? 'Yes' : 'No';
            teachersToUpdate.add(teacher);
        }
        
        
        
        if (!teachersToUpdate.isEmpty()) {
            update teachersToUpdate;
        }
    }
}