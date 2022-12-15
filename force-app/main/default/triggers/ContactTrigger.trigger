trigger ContactTrigger on Contact (before insert, before update,after insert, after update){
    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
            system.debug('we are in before update trigger.');
            ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
    }








/*    if (trigger.isAfter) {
    //System.debug('new inserted record ==> '+ trigger.new);
}
   if (trigger.isBefore) {
    System.debug('We are in BEFORE. Not Saved');
    if (trigger.isInsert) {
        System.debug('we are in before insert trigger.');        
    }
    if (trigger.isUpdate) {
        System.debug('we are in before update trigger');
    }
}
if (trigger.isAfter) {
    System.debug('We are in After.SBNC.');
}
if (trigger.isInsert) {
    System.debug('we are in after insert trigger');
}
if (trigger.isUpdate) {
    System.debug('we are in after update trigger.');
} */

}