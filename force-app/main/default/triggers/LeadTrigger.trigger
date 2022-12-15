trigger LeadTrigger on Lead (before insert, before update) {
    List<Lead> leadTriggerNew = trigger.new;
    if (trigger.isInsert && trigger.isBefore) {
        for (Lead eachLead : leadTriggerNew) {
            System.debug('Lead name is => '+ eachLead.LastName+ ', Lead Id is => '+ eachLead.Id);
        }
    }
    if (trigger.isUpdate & trigger.isBefore) {
        for (Lead eachLead : leadTriggerNew) {
            System.debug('Lead NEW name is => '+ eachLead.LastName + ', Lead Id is => '+ eachLead.Id+ ', And description is => '+ eachLead.Description);
        }
    }
    
}