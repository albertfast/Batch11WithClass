public with sharing class OpportunityCtrl {
    @AuraEnabled(cacheable = true)
   public static List<Opportunity> getMatchingOpps(String stage) {
    return [ SELECT Name,Type,StageName,Amount FROM Opportunity WHERE StageName =: stage AND Amount != NULL ORDER BY Amount DESC LIMIT 5];
   }
} 
/*
public with sharing class OpportunityCtrl {
    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getMatchingOpps(String stage){
        return [SELECT Name, Type, StageName, Amount
                FROM Opportunity
                WHERE StageName =: stage AND Amount != NULL
                ORDER BY Amount DESC
                LIMIT 5];
    }
} */