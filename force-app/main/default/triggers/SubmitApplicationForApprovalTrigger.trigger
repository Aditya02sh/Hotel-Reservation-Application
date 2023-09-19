trigger SubmitApplicationForApprovalTrigger on reservation__c (after insert) {
    List<Approval.ProcessSubmitRequest> approvalRequests = new List<Approval.ProcessSubmitRequest>();

    for (reservation__C app : Trigger.new) {
        // Create an approval request for each Application record
        Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
        req.setObjectId(app.Id);
        approvalRequests.add(req);
    }

    // Submit the approval requests
    Approval.ProcessResult[] results = Approval.process(approvalRequests);

    // Handle any errors or check the results as needed
}