public class ContactTriggerHandler {
    public static void contactUpdateValidation1(list<contact> conTriggerNew, List<contact> conTriggerOld, Map<id,contact> conTriggerNewMap, Map<id,contact> conTriggerOldMap ) {
        
        for (contact eachContact : conTriggerNew) {
            Contact oldContact = conTriggerOldMap.get(eachContact.id);
            if (eachContact.LeadSource == 'Partner Referral') {
                eachContact.addError('Cannot update Partner Referral contact');
            }
        }
    }
}
