trigger CQ_AS_Teacher_Trigger on CQ_AS_SQX_Teacher__c (before update) {
    CQ_AS_Teacher_TriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
}