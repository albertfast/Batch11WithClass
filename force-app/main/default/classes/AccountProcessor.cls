/* I want a way to count the number of cases created through phone, web & email.
 Update the counted value on account in the respective counter field.*/
public with sharing class AccountProcessor {
   @future
   public static void processAccounts(List<Id> accountIds) {
        //collect all the accounts along with its cases
        List<Account> accounts = [SELECT Id, Case_Through_Web__c, 
                                 Case_Through_Phone__c, Case_Through_Email__c,
                                 (SELECT Id, Origin FROM Cases)
                                  FROM Account
                                  WHERE Id IN :accountIds];
        //iterate over the accounts and its respective cases to count them by category
        for (Account acc : accounts) {
            Integer web = 0;
            Integer phone = 0;
            Integer email = 0;
            for (Case cs : acc.Cases) {
                if (cs.Origin == 'Web') {
                    web++;
                } else if (cs.Origin == 'Phone') {
                    phone++;
                } else if (cs.Origin == 'Email') {
                    email++;
                }
            }
            acc.Case_Through_Web__c = web;
            acc.Case_Through_Phone__c = phone;
            acc.Case_Through_Email__c = email;
        }

        //update accounts
        try {
            update accounts;
        } catch (Exception ex) {
            //create a log
            System.debug(ex.getMessage());
        }
   }
}
/*Solution Design
 Future Method: Get the target account ids as input
 Get all the accounts along with its cases. While we iterate through the accounts, 
iterate through
respective cases and find the count by category
 Update the same on the account */







/* Best Practices (Things to keep in mind)
 Future, Queueable, Batchable & Schedulable
 How to choose right asynchronous apex?
 Future Methods:
 When you want a small piece of code to be running in the background
 When you want to avoid mixed DML errors (Inserting a setup and non-setup object records)
 When you want to perform a callout from a trigger
 Limitations:
 You can not call a future method inside another future method
 Future methods accept only primitive data as input parameters*/