public class CampaignUpdateBatch implements Database.Batchable <sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //query
        Database.QueryLocator q1 = Database.getQueryLocator([select id, BudgetedCost,EndDate,Status,Name from Campaign WHERE 	BudgetedCost >0 AND EndDate <=YESTERDAY ]);
        //return CHUNK of it.
        return q1;
    }

    public void execute(Database.BatchableContext bc, list<Campaign> scope){
        //update records.
        
        system.debug('execute method start');
        list <Campaign> updateCamp = new list<Campaign>();
        for(Campaign eachCamp : scope){
            
            eachCamp.Status='Planned';
            updateCamp.add(eachCamp);
                          
        }

        if(!updateCamp.isEmpty()){
        update updateCamp;
        system.debug('execute method done');

        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('finish method called.');
        
    }

}


