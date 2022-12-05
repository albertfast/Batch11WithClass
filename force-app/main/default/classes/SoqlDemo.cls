public  class SoqlDemo {
   public static  void accountSOQL_1(){
    List<Account> listAccount = [select id, name from account where name like '%a%' ];
    System.debug('list of account ==> '+ listAccount);
   }
   public static  void accountSOQL_11(){
    Account acc = [select id, name from account order by CreatedDate desc LIMIT 1];
    System.debug('latest created account is ==> '+ acc);
   } 
   public static  void accountSOQL_2(){
    Account acc = [select id, name, phone, accountnumber from account order by CreatedDate desc LIMIT 1];

    System.debug('latest created account is ==> '+ acc);

    String accName = acc.Name;
    String accPhone= acc.Phone;
    System.debug('accName is '+ accName + ' , phone is '+ accPhone);
    System.debug('account number is '+ acc.AccountNumber);
    }
    public static void accountSOQL_3(){
    List<Account> listAcc = [select id, name, phone, accountnumber, ShippingCity from account order by CreatedDate desc];

    for (Account eachAcc : listAcc) {
        String accName = eachAcc.Name;
        string accPhone = eachAcc.Phone;
        System.debug('acc name is '+ accName + ' , acc phone is '+ accPhone+ ' account number is '+ eachAcc.AccountNumber);
        string sc = eachAcc.ShippingCity;
        System.debug(eachAcc.ShippingCity);
    }
    }
    public static void accountSOQL_filter(string accNameFilter) {
        // wa want to filter with accNameFilter ( string variable) in SOQL
        //to use variable in SOQL we must add ':' (colon) before variable name
        List<Account> listAcc = [ select id, name, phone from account where name = :accNameFilter ];
        System.debug('list of accounts ==> '+ listAcc);
    }

    public static void accountSOQL_filter(list<string> accNames) {
        // wa want to filter with accNameFilter ( string variable) in SOQL
        //to use variable in SOQL we must add ':' (colon) before variable name
        List<Account> listAcc = [ select id, name, phone from account where name IN :accNames ];
        System.debug('list of accounts ==> '+ listAcc);
    }
}