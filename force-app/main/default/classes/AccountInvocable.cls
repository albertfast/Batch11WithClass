public with sharing class AccountInvocable {
    @InvocableMethod(label='Delete Opportunities' description='Deletes all the closed opportunities' category = 'Account')
    public static void deleteOpportunities(List<Id> accountIds) {
        List<Opportunity> opps = [SELECT Id 
                                  FROM Opportunity
                                  WHERE AccountId IN:accountIds
                                  AND StageName IN ('Closed Won', 'Closed Lost')
                                  WITH SECURITY_ENFORCED];
       delete opps;                            
    }
}