trigger CQ_AS_Student_Trigger on CQ_AS_SQX_Student__c (before update,after insert, after delete) {
    if(trigger.isBefore && trigger.isUpdate){
    CQ_AS_Student_TriggerHandler.handleBeforeChange(Trigger.new,Trigger.oldMap);
        
    }
    if(trigger.isAfter && trigger.isInsert){
        
         CQ_AS_Student_TriggerHandler.handleAfterMethod(Trigger.new); 
        
    }
    if(trigger.isAfter && trigger.isDelete){
        
         CQ_AS_Student_TriggerHandler.handleAfterMethod(Trigger.old); 
        
    }
    
    
}