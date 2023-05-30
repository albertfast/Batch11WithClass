@isTest
public  class DmlDemoTest {
    @isTest
    public static void dmlInsert1Test() {
        DmlDemo.dmlInsertDemo_stndObj();
        //asserts meaning actual TEST.

        //get records, and test.
        List<Account> listAcc = [select id,name from account where name = 'SoftInnovas'];
        System.assertEquals(1, listAcc.size());
        system.assertEquals('SoftInnovas', listAcc[0].Name);
    }
    @isTest
    public static void dmlInsert4test() {
        account acc = new account();
        acc.Name='SoftInnovas Inc.';
        insert acc;
        DmlDemo.dmlInsertDemo_4();

        List<Contact> listContact = [select id,name from contact where LastName='Biden'];
        System.assertEquals(1, listContact.size());
       // System.assertEquals('Biden', listContact[0].LastName );
    }
    @isTest
    public static void dmlInsert55Test() {
        Salesforce_Project__c sp= new Salesforce_Project__c();
        sp.Project_Name__c = 'Test SP';
        sp.Status__c= 'New';
        insert sp;
        DmlDemo.dmlUpdateDemo_2_Co();
        //verify if ticket is inserted;
        //soql to get ticket records.
        List<Salesforce_Ticket__c> listST = [SELECT id, name,subject__c,Salesforce_Project__c from Salesforce_Ticket__c where Salesforce_Project__c = :sp.Id and subject__c = 'Learn APEX'];
        System.assertEquals('Learn APEX', listST[0].Subject__c);
    }
}