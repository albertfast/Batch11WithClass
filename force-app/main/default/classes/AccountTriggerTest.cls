@isTest
public class AccountTriggerTest {
    @isTest
   public static void testMethod1() {
    account acc1= new account();
    acc1.name= 'SI Test';
    acc1.industry= 'Energy';

    account acc2= new account();
    acc2.name= 'UI Test';
    acc2.industry= 'Energy';

    account acc3= new account();
    acc3.name= 'PI Test';
    acc3.industry= 'Banking';

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

   }
}
