public class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
    try {
            
            
            List<Salesforce_Ticket__c>  listST = new List<Salesforce_Ticket__c>();
            //Get the default ORG value using 'getOrgDefaults' method of custom settings.
            DefaultTicketInfo__c defaultValues = DefaultTicketInfo__c.getOrgDefaults();

            for (salesforce_project__c eachSP : spTriggerNew) {
                Salesforce_Ticket__c newST = new Salesforce_Ticket__c();
                //set the Ticket subject = custom setting value's subject.
                newST.Subject__c = defaultValues.Subject__c ; //Make it dynamic,so admin or dev can change it.
                newST.Salesforce_Project__c = eachSP.Id;
                newST.Description__c = defaultValues.Description__c;
                newST.Priority__c= 'Medium';
                listST.add(newST);
            }
            if (!listST.isEmpty()) {
                list<Database.SaveResult> results =Database.insert(listST, false);
                for( Database.SaveResult eachResult : results ){
                    if(eachResult.isSuccess()){
                       //succesfuly inserted
                       //Handle insertion
                       System.debug('Account Succesfully inserted, Account Id is: '+ eachResult.getId()); 
                    }else{
                        //Error ecountered
                        System.debug('Errors : ' + eachResult.getErrors());
                    }
                }
                
            }
        } catch(exception ex){
            for (salesforce_project__c sp : spTriggerNew) {
                sp.addError('Error in inserting Default Ticket. Please contact your dear administrator');
            }
        }
    }

    public static void completeSPvalidation(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld, 
    Map<id,salesforce_project__c> spTriggerNewMap, Map<id,salesforce_project__c> spTriggerOldMap) {
        
        set<id> spCompletedIds = new set<id>();
        for (salesforce_project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c == 'Completed' && eachSP.Status__c != SpTriggerOldMap.get(eachSP.id).Status__c) {
                spCompletedIds.add(eachSP.Id);
            }
        }

        //get all tickets which are not compelted.
        List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
                                            where Salesforce_Project__c in :spCompletedIds
                                            and status__c != 'Completed'];
        for (salesforce_ticket__c eachST : listST) {
            Salesforce_Project__c spNew = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            spNew.addError(
                'Cannot complete project because all tickets are not completed. Go away.'
            );
        }
    }
    @future
    public static void spUpdateDescription(set<id> setSPId) {
        List<Salesforce_Project__c> allSP = [SELECT id, description__c from Salesforce_Project__c where id in :setSPId];
        for (Salesforce_Project__c eachSp : allSP) {
            eachSp.Description__c += '. Updated from future';            
        }
        update allSP;
        System.debug('future method called. Huhuuu');
    }

    public static void spStatusCompleted(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld, 
    Map<id,salesforce_project__c> spTriggerNewMap, Map<id,salesforce_project__c> spTriggerOldMap) {
        
        //get spIds whose status is changed to 'Completed'
        Set<Id> spCompleted = new set<Id>();
        for (Salesforce_Project__c sp : spTriggerNew) {
            if (sp.Status__c == 'Completed' && sp.Status__c != spTriggerOldMap.get(sp.Id).Status__c ) {
                spCompleted.add(sp.Id);
            }
        }
        //call future method to update tickets.
        if (!spCompleted.isEmpty()) {
            updateTicketStatus(spCompleted);
        }
    }
    @future
    public static void updateTicketStatus(set<id> ProjectIds) {
        //get all tickets
        List<Salesforce_Ticket__c> allTickets = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in :ProjectIds and status__c != 'Completed'];
        //set status completed
        for (Salesforce_Ticket__c eachST : allTickets) {
            eachST.Status__c= 'Completed';
        }
        //update tickets.
        update allTickets;
    }
}