@isTest
public  class sf_assgTest {
    @isTest
   public static void testSfProject() {
    sf_assg.insertsf();
   List<Salesforce_Project__c> lstsf = [SELECT Id, Name, Project_Name__c FROM Salesforce_Project__c where Project_Name__c  = 'Phone23'];
    System.assertEquals(10, lstsf.size());
   }
   @isTest
   public static void testSfProject2() {
    Salesforce_Project__c sfp = new Salesforce_Project__c();
    sfp.Project_Name__c='Phone23';
    insert sfp;
    sf_assg.updatesf();
    list<Salesforce_Project__c> lstsf =  [select id,Project_Name__c from Salesforce_Project__c where Project_Name__c like '%Phone%' limit 1];
    System.assertEquals(1, lstsf.size());
    System.assertEquals('Phone2', lstsf[0].Project_Name__c );
   }
}