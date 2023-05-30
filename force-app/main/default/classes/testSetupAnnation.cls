public class testSetupAnnation {
   public static integer accountSelectIndustry(string indus) {
    List<Account> accList = [SELECT Id, Name, Industry FROM Account WHERE Industry =: indus];
    integer recordSize = accList.size();
    return recordSize;
   }

   public static void childToParentSoql() {
    List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE Account.industry = 'Energy'];

        for (Contact con : conList) {
            con.LastName = con.LastName + ' fromTestSetup';
        }

        update conList;
   }
}