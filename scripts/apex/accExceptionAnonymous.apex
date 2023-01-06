try {
    Account ac = new Account();
    insert ac;
} /* catch(DmlException dex){
    System.debug('DML went wrong. ');
} */ catch(Exception Ex) {
    System.debug('Something went wrong buddy. ');
    System.debug('ex => ' + ex.getMessage());
    System.debug('ex line number : ' + ex.getLineNumber());  
}

    System.debug('Apex is SIMPLE');


    try {
    Contact cn = new Contact();
    cn.LastName ='EEEE';
    insert cn;
} /* catch(DmlException dex){
    System.debug('DML went wrong. ');
} */ catch(Exception Ex) {
    System.debug('Something went wrong buddy. ');
    System.debug('ex => ' + ex.getMessage());
    System.debug('ex line number : ' + ex.getLineNumber());  
}

    System.debug('Apex is SIMPLE');







    Mark the Status of field on Contact as Required. 
1.	On Account Trigger, for before insert try to create a contact record. 
2.	Make status field as Required on the Contact Object. 
3.	Throw an error message if the status is missing from the trigger. 
