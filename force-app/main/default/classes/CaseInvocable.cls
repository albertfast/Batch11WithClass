public with sharing class CaseInvocable {
    @InvocableMethod(label='Send Email & Save As Activity' description='Send Email & Save As Activity')
    public static void sendEmail(List<FlowRequest> inputs) {
        FlowRequest request = inputs[0];
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage msg = new  Messaging.SingleEmailMessage();
        msg.setSubject('Case Created : ' + request.caseNumber);
        msg.setPlainTextBody('Hello there! \n A case created.');
        msg.setTargetObjectId(request.contactId);
        msg.setSaveAsActivity(true);
        msgs.add(msg);

        Messaging.sendEmail(msgs);
    }

    public class FlowRequest{
        @InvocableVariable(label = 'Case Number' description = 'Case Number' required = true)
        public string caseNumber;
        @InvocableVariable(label = 'Contact Id' description = 'Contact Id' required = true)
        public Id contactId;
    }
}