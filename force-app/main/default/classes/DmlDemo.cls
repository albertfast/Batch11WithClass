public class DmlDemo {
   public static void dmlInsertDemo_stndObj() {
    //create a new account record using apex code (DML)
    //Create new instance 
    Account acc = new Account();

    //2. set values to fields
    acc.Name = 'SoftInnovas';
    System.debug('Not inserted ' +acc);
    //dml.
    insert acc; //booom
    System.debug('Inserted' +acc);
   }

   public static void dmlInsertDemo_cstmObj() {
    //1. create new instance
    Salesforce_project__c spNew = new Salesforce_project__c();
    //2.set field values
    spNew.project_name__c = 'Teach DML to batch 11';
    spNew.description__c = 'Everybody is doing great. Keep it up. ';
    //3 dml
    insert spNew;
    }
   
    public static void dmlUpdateDemo_1() {
        //create new instance
        Account acc = new Account();
        acc.Name = 'softInnovas';
        insert acc;
        //2. chance field values
        acc.Name= 'Salesforce Inc.';
        //update DML
        update acc;
        System.debug(acc);
    }
}
