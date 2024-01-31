public with sharing class LWCAccountsController {
    @AuraEnabled
    public static List<Account> getAccounts(String searchText){
        try {
            if (String.isEmpty(searchText)) {
                System.debug('Query: ' + [SELECT Id, Name FROM Account]);
                return [SELECT Id, Name FROM Account];
            } else {
                searchText = '%' + searchText + '%';
                System.debug('Query: ' + [SELECT Id, Name FROM Account WHERE Name LIKE :searchText]);
                return [SELECT Id, Name FROM Account WHERE Name LIKE :searchText];
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
