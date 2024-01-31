public with sharing class ListOfAccountController {
    @AuraEnabled(cacheable=true)
     
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Phone FROM Account WHERE AnnualRevenue > 2000 LIMIT 30];
    }
    
    }






