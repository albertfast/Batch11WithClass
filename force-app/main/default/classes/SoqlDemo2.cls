public class SoqlDemo2 {
   public static void soqlchildToParent_1() {
    List<Contact> listContacts = [select id, name, account.name, account.industry from contact where account.industry = 'Energy'];
    System.debug(listContacts);
    for (Contact eachContact : listContacts) {
        //get account name from contact record
        String accName = eachContact.Account.name;
                         //contact name from contact record
        System.debug(' contact name = ' + eachContact.Name + ', its acc name is '+ accName);
    }
   }
    //questin1 = Print the annual revenue and name of all the accounts of type ‘Customer-Direct’

    //question2= And also print the Opportunuty Name and Amount for the respective ‘Closed Won’ opportunities
    public static void soqlParentToChild_1() {
    //If our outer query is acount. and inner query is opportunity.
    //What list it would return ==> account.
    List<Account> listAccOpp = [select id, name, annualrevenue, type,(select name, amount 
    from opportunities where stageName = 'Closed Won') from account where type = 'Customer - Direct'];

    for (account eachAcc : listAccOpp) {
        System.debug('acc name ==> ' + eachAcc.Name+ ', annual revenue is ==> '+ eachAcc.AnnualRevenue);
        List<Opportunity> listOpp= eachAcc.Opportunities;
        for (opportunity eachOpp : listOpp) {
            System.debug('-- opp name ==> '+ eachOpp.Name+ ', amount is '+ eachOpp.Amount);
        }
    }

   }
}
