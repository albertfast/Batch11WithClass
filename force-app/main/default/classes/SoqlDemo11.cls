public class SoqlDemo11 {
    //Account recorlarindan Industry 'Education' olanlarin listesinin record sayisini bulup return eden bir metot yazin..
    public static integer accountIndustry(string indstry) {
    List<Account>  accList =  [select id,name from account where Industry =: indstry];
    System.debug(accList);
    integer recordSayisi=accList.size();
        return recordSayisi; // return integer oldusu icin methodum void olamaz intehere ceviririz.
    }
    //Accountlardan industry Energy olanlari contactlari ile beraber listeleyin ve her bir recordu tek tek yazin..
    public static void accountWithContacts() {
        List<Account> accList = [select id, name, (select id, lastName from Contacts) from account where Industry = 'Energy'];
        System.debug(accList);
        for (account acc : accList) {
            System.debug(acc.name);
            System.debug(acc.contacts);
            for (contact con : acc.contacts) {
                System.debug(con.lastName);
            }
        }
    }
}
