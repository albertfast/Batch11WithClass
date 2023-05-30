@isTest
public class AccountsBatchTest {
@isTest
    private static void testBatch1() {
        //1.Prepare data
        List<Account> listAcc = new List<Account>();

        for (Integer i = 0; i < 900; i++) {
            Account a = new account();
            a.Name = 'Pi account ' + i;
            a.Active__c = 'Yes';
            listACC.add(a);
        }
        insert listAcc;

        //start test.
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        Database.executeBatch(ab, 1000);
        Test.stopTest();

        //3.assert
        List<Account> getAcc = [select id, description from Account];
        System.assert(getAcc[0].Description.contains('batch'));
    }    
}

