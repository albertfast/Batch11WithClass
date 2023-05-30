public class Trigger_Map {
   public id InsertSF_Project() {
    Salesforce_Project__c sf = new Salesforce_Project__c();
    sf.project_name__c = 'Assignment 12 December';
    insert sf;
    return sf.Id;
   }
   public void UpdateSF_Project(Id z, string name) {
    Salesforce_Project__c updateSf = new Salesforce_Project__c();
    updateSf= [SELECT id, Project_Name__c FROM Salesforce_Project__c Where Id=: z];
    updateSf.Project_Name__c = 'Assignment UPDATE record ';
    update updateSf;
   }
}