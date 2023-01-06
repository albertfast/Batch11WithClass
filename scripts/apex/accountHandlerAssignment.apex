List<Account> accList = new List<Account>();
for(integer i=0; i<10; i++){
    Account acc = new Account();
    acc.Name = 'Advance Assignment ' + i;
    accList.add(acc);
}
insert accList;

Map<Id,Account> accountMap = new Map<Id,Account>([ SELECT Id, name FROM Account]);
Set<Id> accountIds = accountMap.keySet();
AccountHelper.checkSizeConOnAcc(accountIds);