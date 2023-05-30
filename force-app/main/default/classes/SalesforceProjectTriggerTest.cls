@isTest
public class SalesforceProjectTriggerTest {
    @isTest
    public static void spTestMethod1() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn Test and Assert';
        sp.Description__c = 'You are doing good job my man!';
        sp.Status__c= 'New';
        insert sp;

        List<Salesforce_Ticket__c> st = [select id, subject__c, Salesforce_Project__c, Priority__c from Salesforce_Ticket__c where Subject__c  = 'Default ticket'];
        System.assertEquals(1, st.size());
        System.assertEquals(sp.Id, st[0].Salesforce_Project__c);

    }
@isTest
        public static void spTestMethod2() {
            Salesforce_Project__c spNewPro = new Salesforce_Project__c();

            spNewPro.Project_Name__c= 'Non Stop!!';
            spNewPro.Status__c= 'Completed';
            insert spNewPro;
         List<Salesforce_Project__c> takeToList = [select id,Project_Name__c,Status__c from Salesforce_Project__c where Status__c = :spNewPro.Status__c = 'Completed'];
         
         for (Salesforce_Project__c eachPro : takeToList) {
            eachPro.Status__c = 'Completed';
         }
         List<Salesforce_Project__c> updateList = [select id,Project_Name__c,Status__c from Salesforce_Project__c where Status__c = :spNewPro.Status__c = 'Completed'];
         for (Salesforce_Project__c eachPro : updateList) {
            eachPro.Status__c = 'Completed';
         }
         update takeToList;
         System.assertNotEquals('Cannot complete project because all tickets are not completed. Go away.', updateList[0].Status__c);
        }
        @isTest
        public static void testUpdateDescription() {
            Salesforce_Project__c sp1 = new Salesforce_Project__c();
            sp1.Project_Name__c = 'SP Test 1';

            Salesforce_Project__c sp2 = new Salesforce_Project__c();
            sp2.Project_Name__c = 'SP Test 2';

            List<Salesforce_Project__c> listSP = new list<Salesforce_Project__c>{sp1,sp2};
            insert listSP;

            Set<Id> setSPId = new Set<Id>{sp1.Id, sp2.Id};

            test.startTest();
            SalesforceProjectTriggerHandler.spUpdateDescription(setSPId);
            test.stopTest();

            List<Salesforce_Project__c> allSP= [select id, description__c from Salesforce_Project__c ];
            system.assert(allSP[0].Description__c.contains('future'));
        }
        
}