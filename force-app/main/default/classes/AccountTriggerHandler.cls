public class AccountTriggerHandler {
  public static void updateDescription(List<Account> accTriggerNew, List<account> accTriggerOld,
                              Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
      for (account eachAcc : accTriggerNew) {
          boolean updateDesc = false;
          if (Trigger.isInsert && eachAcc.Active__c == 'Yes') {
              //just update field
              updateDesc = true;
          }
          //if account is updated.
              //check if active field is changed from not yes to yes
              //then update description
          if (Trigger.isUpdate) {
              //get old account using OldMAP
              Account oldAccount = accTriggerOldMap.get(eachAcc.Id);
              //get new account using newMap
              Account newAccount = accTriggerNewMap.get(eachAcc.Id);
              //oldAccount.Active__c != newAccount.Active__c
              if (eachAcc.Active__c == 'Yes' &&
                 oldAccount.Active__c != newAccount.Active__c ) {
                  updateDesc = true;
              }
          }
          if (updateDesc) {
              eachAcc.Description = 'Account is now active. Enjoy buddy!!';
          }
      }
  }
  public static void beforeDelete(Map<Id,Account> oldAccounts) {
    //collect all the contacts, case & opps
    List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId IN :oldAccounts.keySet()];
    List<Case> cases = [SELECT Id FROM Case WHERE AccountId IN :oldAccounts.keySet()];
    List<Opportunity> Opportunities = [SELECT Id FROM Opportunity WHERE AccountId IN :oldAccounts.keySet()];
    //delete all records
    try{
        delete contacts;
        delete cases;
        delete Opportunities;
    } catch(Exception ex){
        System.debug(ex.getMessage());
    }
}
}




