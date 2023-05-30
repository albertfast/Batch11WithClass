@isTest
public class testSetupAnnationTest {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();

        Account acc1 = new Account();
        acc1.Name = 'Salesforce';
        acc1.Industry = 'Education';
        accList.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'SoftInnovas';
        acc2.Industry = 'Energy';
        accList.add(acc2);

        Account acc3 = new Account();
        acc3.Name = 'Green Book';
        acc3.Industry = 'Education';
        accList.add(acc3);

        insert accList;

        List<Contact> conList = new List<Contact>();

        for (Integer i = 1; i < 300; i++) {
            if (i<=100) {
                Contact c = new Contact();
                c.LastName = 'Test 1';
                c.AccountId = acc1.Id;
                conList.add(c);
            }else if (i<=200) {
                Contact c = new Contact();
                c.LastName = 'Test 2';
                c.AccountId = acc2.Id;
                conList.add(c);
            }else {
                Contact c = new Contact();
                c.LastName = 'Test 3';
                c.AccountId = acc3.Id;
                conList.add(c);
            }
        }
        insert conList;
    }
    @isTest 
    private static void accountSelectIndustry() {
        test.startTest();
        Integer sz = testSetupAnnation.accountSelectIndustry('Education');
        test.stopTest();

        System.assertEquals(2, sz);
    }
    @isTest 
    private static void childToParentSoql() {
        test.startTest();
        testSetupAnnation.childToParentSoql();
        test.stopTest();
        
        List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE LastName = 'Test 2 fromTestSetup'];
        System.assert(conList.size()>0);
        System.assertEquals(100, conList.size());
    }
}