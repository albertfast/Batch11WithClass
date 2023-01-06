Account acc1 = new Account();
acc1.Name= 'SI Test1';
acc1.Industry = 'Energy';
acc1.Active__c= 'No';

Account acc2 = new Account();
acc2.Name= 'UI Test2';
acc2.Industry = 'Energy';
acc2.Active__c= 'Yes';
//required filed is missing.

Account acc3 = new Account();
Account acc4 = new Account();

List<Account> listAcc = new List<Account>{acc1,acc2,acc3,acc4};

list<Database.SaveResult> results = Database.insert(listAcc, false);

for( Database.SaveResult eachResult : results ){
    if(eachResult.isSuccess()){
       //succesfuly inserted
       //Handle insertion
       System.debug('Account Succesfully inserted, Account Id is: '+ eachResult.getId()); 
    }else{
        //Error ecountered
        System.debug('Errors : ' + eachResult.getErrors());
    }
}
