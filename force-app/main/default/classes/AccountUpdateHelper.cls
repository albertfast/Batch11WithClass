public  class AccountUpdateHelper {
    //invocable method we can call from Process builder of Flows.
    @InvocableMethod
    public static void accountWebsiteUpdate(list<id> accIds) {
        System.debug('inside invocable method ');
        //get all accounts from accIds
        List<Account> listAcc= [select id, website, name from account where id in :accIds];
        for (account eachAcc : listAcc) {
            //update wesite
            eachAcc.Website='www.softinnovas.com';
        }
        //update dml
        update listAcc;
    }
    
}
