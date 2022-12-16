/* •	Create a trigger on Salesforce_Project__c
•	Trigger should work on before update,before insert,after insert,after update.
•	Use the Trigger.New on insert and set the name of Project as ‘New Trigger Project’ before insert. Use system.debug to display the project name.
•	Use Trigger.newMap and Trigger.newMap on update. Use for loop on the map variable and use system.debug to display the project name before update and project name after update. */



trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, before update,after insert, after update) {
   /*  if (trigger.isAfter && trigger.isInsert) {
        SalesforceProjectTriggerHandler.createDefaultTicket(trigger.new);
    } */
if (trigger.isBefore && trigger.isInsert) {
    for (Salesforce_Project__c eachSp : trigger.new) {
        eachSp.Project_Name__c = 'New Trigger Project';
        System.debug(eachSp.Project_Name__c);
    }
}
if (trigger.isAfter && trigger.isUpdate) {
    Map<Id,Salesforce_Project__c> sfNewMap = trigger.newMap;
    Map<Id,Salesforce_Project__c> sfOldMap = trigger.oldMap;

    Set<id> sfIDS = sfNewMap.keySet();
    for( Id eachSf : sfIDS) {
        System.debug('Proje ESKI Ismi => '+ sfOldMap.get(eachSf).Project_Name__c+', Proje YENI Ismi => '+ sfNewMap.get(eachSf).Project_Name__c);
    }
}


}