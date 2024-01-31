public with sharing class ListOfContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
       return [SELECT Id,LastName,Email FROM Contact LIMIT 15];
    }
}