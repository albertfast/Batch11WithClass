public class AccountHandler_assg {
    public static void makeContact(List<Account> newAccList, List<Account> oldAccList, Map<Id,Account> newAccMap , Map<Id,Account> oldAccMap) {
        List<Contact> newConList = new List<Contact>();
        for (Account acc : newAccList) {
            Contact con = new Contact();
            con.LastName = 'Learn Trigger Advance';
            con.AccountId = acc.Id;
            newConList.add(con);
        }
        insert newConList;
    }
}