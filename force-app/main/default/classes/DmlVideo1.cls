public class DmlVideo1 {
    public static void createContact() {
        Contact cn = new Contact();
        cn.Salutation = 'Mr.';
        cn.LastName = 'Test Dml Contact Org';
        insert cn;
    }
    public static void createUpdateContact() {
        Contact c = new Contact();
        c.LastName = 'Ordek';
        insert c;
        System.debug(c); 

        c.FirstName = 'Albert';
        update c;
    }
    public static void updateOneContact() {
        Contact cn = [SELECT Id, lastName, firstName 
        FROM Contact WHERE lastName = 'Leylek'];
        cn.FirstName = 'Cemil';
        cn.Phone = '6895872587';
        cn.Email = 'dmlrepeat@thanks.com';
        update cn;
    }
    public static Id createAccount() {
       Account acc = new Account();
       acc.Name = 'Insert Account With Contact';
       insert acc;
       return acc.Id; 
    }
    public static void createContactWithAccount() {
        Id accId = createAccount();
        Contact con = new Contact();
        con.LastName = 'It will add account';
        con.AccountId = accId;
        insert con;
    }
    public static void updateContactForAccount() {
        /*Account acc = [ SELECT Id, name 
        FROM Account WHERE name = 'Insert Account With Contact' LIMIT 1]; */
        Account acc = [ SELECT Id, name FROM Account order by CreatedDate desc LIMIT 1];  
        Contact con = [ SELECT Id, name FROM Contact WHERE AccountId = null limit 1];
        System.debug('Contact ==>' + con);
        con.AccountId = acc.Id;
        con.LastName= 'Ogrenmek Zevkli';
        update con;    
    }
    public static void createMultipleAccountAndContacts() {
        //5 account create ettik ve bunlara bagli 5 er contact create ettik.
        List<Account> accList = new List<Account>();
        for (Integer i = 1; i <= 5; i++) {
            Account acc = new Account();
            acc.Name = 'Loop Account ' + i;
            accList.add(acc);
        }
        if (!accList.isEmpty()) {
            insert accList;
        }

        List<Contact> conList = new List<Contact>();
        for (Account ac : accList) {
            for (Integer i = 1; i <= 5; i++) {
                Contact cn = new Contact();
                cn.LastName = 'Loop Contact ' + i;
                cn.AccountId = ac.Id;
                conList.add(cn);
            }
        }
        if (!conList.isEmpty()) {
            insert conList;
        }
        
    }
}