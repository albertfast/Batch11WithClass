@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void testMethod1() {
        account acc1= new account();
        acc1.name= 'SI Test';
        acc1.industry= 'Energy';
        acc1.Active__c= 'No';

        account acc2= new account();
        acc2.name= 'UI Test';
        acc2.industry= 'Energy';
        acc2.Active__c= 'Yes';

        account acc3= new account();
        acc3.name= 'PI Test';
        acc3.industry= 'Banking';
        acc3.Active__c= 'No';

        List<Account> listAcc = new List<account>{acc1, acc2, acc3};
        insert listAcc;

        list<contact> listContact = new List<Contact>();
        for (Integer i = 0; i < 300; i++) {
            Contact cnt = new Contact();
            cnt.LastName= 'Test SOQL';
            if (i<100) {
                cnt.AccountId = acc1.id;
            }else if (i<200) {
                cnt.AccountId= acc2.id;
            } else {
                cnt.AccountId= acc3.id;
            }
            listContact.add(cnt);
        }
        insert listContact;
        List<Account> insertYesList =[select name,Active__c,description from account where active__c= 'Yes'];
        system.assertEquals('Account is now active. Enjoy buddy!!', insertYesList[0].Description);
        
        for (account eachAcc : listAcc) {
            eachAcc.Active__c= 'Yes';
        }
        update listAcc;

        List<Account> updateYesList =[select name,Active__c,description from account where active__c= 'Yes'];
        system.assertEquals('Account is now active. Enjoy buddy!!', updateYesList[0].Description);
    }
    @isTest
    private static void testUpdateVIPContacts() {
         //create Accounts.
         Account acc1 = new account();
         acc1.name = 'SI Test';
         acc1.Industry = 'Energy';
         acc1.Active__c = 'No';
 
         Account acc2 = new account();
         acc2.name = 'UI Test';
         acc2.Industry = 'Energy';
         acc2.Active__c = 'Yes';
 
         Account acc3 = new account();
         acc3.name = 'PI Test';
         acc3.Industry = 'Banking';
         acc3.Active__c = 'No';
 
         List<account> listAcc = new list<account>{acc1, acc2, acc3};
         insert listAcc;
 
         //create related contacts.
         list<contact> listcontact = new list<contact>();
         for (Integer i = 0; i < 300; i++) {
             contact cnt = new contact();
             cnt.LastName = 'Test SOQl';
             if (i < 100) {
                 cnt.accountid = acc1.id;
             } else if (i < 200) {
                 cnt.accountid = acc2.id;
             } else {
                 cnt.accountid = acc3.id;
             }
             listcontact.add(cnt);
         }
         insert listcontact;
 
         //update vip field of account.
             for (account eachAcc : listAcc) {
                 eachAcc.vip__c = true;
             }
             update listAcc;
             //trigger will auto update for contacts. which we want to verify.
 
         //get records from contact using soql
         list<contact> allContacts = [select id, vip__c from contact];
        
         for (contact eachContact : allContacts) {
             system.assertEquals(true,eachContact.vip__c);
         }
         //assert.
    }
}