DmlVideo1.createContact();
DmlVideo1.createUpdateContact();
DmlVideo1.updateOneContact();
DmlVideo1.createContactWithAccount();
DmlVideo1.updateContactForAccount();
DmlVideo1.createMultipleAccountAndContacts();

Account acc = new Account();
acc.Name = 'Default';
insert acc;  
//Bu accounta, herhangi bir accouna bagli olmayan contacklari bagladik
 
List<Contact> conList = [SELECT Id, Name, AccountId 
FROM Contact WHERE AccountId = null];
System.debug(conList);
System.debug(conList.size());

Account acc = [SELECT Id, Name 
FROM Account WHERE Name = 'Default' LIMIT 1];
Id accId = acc.Id;
for (Contact cn : conList) {
    cn.AccountId = accId;
}
update conList; 