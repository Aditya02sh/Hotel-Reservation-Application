public class CQ_AS_Teacher_TriggerHandler {

    // Method to handle before update logic for CQ_AS_SQX_Teacher__c
    public static void handleBeforeUpdate(List<CQ_AS_SQX_Teacher__c> newTeachers, Map<Id, CQ_AS_SQX_Teacher__c> oldTeachersMap) {
        // Map to store teacher IDs as keys and associated students as values
        Map<Id, List<CQ_AS_SQX_Student__c>> teacherToStudentsMap = new Map<Id, List<CQ_AS_SQX_Student__c>>();

        // Iterate through the new teachers being updated
        for (CQ_AS_SQX_Teacher__c teacher : newTeachers) {
            // Get the old teacher for comparison
            CQ_AS_SQX_Teacher__c oldTeacher = oldTeachersMap.get(teacher.Id);

            // Check if the course status is changing from 'In Progress' to 'Completed'
            if (teacher.CQ_AS_Course_Status__c == 'Completed' && oldTeacher.CQ_AS_Course_Status__c == 'In progress') {
                // If yes, initialize an empty list for associated students
                teacherToStudentsMap.put(teacher.Id, new List<CQ_AS_SQX_Student__c>());
            }

            // Check if the course status is 'Closed'
            if (oldTeacher.CQ_AS_Course_Status__c == 'Closed') {
                // If yes, prevent updating and display an error
                teacher.CQ_AS_Course_Status__c.addError('Updating not allowed when course is already closed!');
            }
        }

        // Populate the teacherToStudentsMap with associated students who have non-empty marksheets
        if (!teacherToStudentsMap.isEmpty()) {
            for (CQ_AS_SQX_Student__c student : [SELECT Id, CQ_AS_SQX_Teacher_Lookup__c 
                                              FROM CQ_AS_SQX_Student__c 
                                              WHERE CQ_AS_SQX_Teacher_Lookup__c IN :teacherToStudentsMap.keySet() 
                                              AND CQ_AS_Marksheet__c != NULL]) {
                teacherToStudentsMap.get(student.CQ_AS_SQX_Teacher_Lookup__c).add(student);
            }

            // Check if any player has a non-empty marksheet for teachers with 'Completed' status
            for (CQ_AS_SQX_Teacher__c teacher : newTeachers) {
                if (teacher.CQ_AS_Course_Status__c == 'Completed' && teacherToStudentsMap.get(teacher.Id).isEmpty()) {
                    // If not, prevent updating and display an error
                    teacher.CQ_AS_Course_Status__c.addError('One Marksheet of any Student should be there for course to be completed!');
                }
            }
        }
    }
}