public class AccountHelper {
    @future
    public static void checkSizeConOnAcc( Set<Id> accountIds) {
        List<Account> accList = [ SELECT Id, name,( SELECT Id from contacts) FROM Account where Id in :accountIds];
        for (Account acc : accList) {
            acc.Number_of_contacts__c = acc.Contacts.size();
        }
        update accList;
    }
}
