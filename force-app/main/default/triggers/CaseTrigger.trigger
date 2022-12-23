trigger CaseTrigger on Case (before insert, before update) {
    if (trigger.isInsert) {
        System.debug('Before Insert case trigger called. ');
    }
    if (trigger.isUpdate) {
        System.debug('Before Update case trigger called. ');
         CaseTriggerHandler.countTriggerExecution++;
         System.debug('# of times trigger ran: '+ CaseTriggerHandler.countTriggerExecution);
         integer size = trigger.size;
CaseTriggerHandler.countTriggerRecords+= size;
System.debug('# of times trigger Update: '+ CaseTriggerHandler.countTriggerRecords);         
    }
}