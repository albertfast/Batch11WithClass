public class contactListCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Account> getContactList(Boolean flag){
        try {
            List<Account> accList = [SELECT Id,Name from Account WHERE Id in (SELECT AccountId from Contact) LIMIT 15];
            return accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}