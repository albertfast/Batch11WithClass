public with sharing class CarCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Car__c> getCars(String type) {
        String filter = '';
        String query = '';
        if(type != 'All') {
            filter = 'WHERE Category__c = \'' + type + '\'';
        }
        query = 'SELECT Id, Name, Category__c, Make__c, Price__c, Picture_URL__c FROM Car__c '
            + filter
            + ' ORDER BY Make__c';
        return Database.query(query);
    }
}