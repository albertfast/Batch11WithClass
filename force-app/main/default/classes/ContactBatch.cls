public  class ContactBatch implements Database.Batchable<SObject>, Database.stateful {
    integer count = 0;
    integer countRecords = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([ SELECT Id, Description FROM Contact]);
        return q1;
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope){
        count++;
        System.debug('execute method start');
        List<Contact> updateConDes = new List<Contact>();
        for (contact eachCon : scope) {
            eachCon.Description += '... Updated by Batch.';
            updateConDes.add(eachCon);
            countRecords++;
        }
        if (!updateConDes.isEmpty()) {
            update updateConDes;
        }
        system.debug('Execute method count: ' + count);
        system.debug('number of records proccessed count: ' + countRecords);
        system.debug('execute method done');
    }
    public void finish(Database.BatchableContext bc){
        system.debug('finish method called. Enjoy.');
        system.debug('FINISH Execute method count: ' + count);
        system.debug('FINISH number of records proccessed count: ' + countRecords);
   }
}





