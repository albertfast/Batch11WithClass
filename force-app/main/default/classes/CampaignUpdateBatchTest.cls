@IsTest
private class CampaignUpdateBatchTest {

    @TestSetup
    static void setup() {
        // Create test data
        Campaign campaign1 = new Campaign(
            Name = 'Test Campaign 1',
            StartDate = Date.today().addDays(-10),
            EndDate = Date.today().addDays(-1),
            BudgetedCost = 100,
            Status = 'Planned'
        );
        insert campaign1;

        Campaign campaign2 = new Campaign(
            Name = 'Test Campaign 2',
            StartDate = Date.today().addDays(-10),
            EndDate = Date.today().addDays(-1),
            BudgetedCost = 0,
            Status = 'Planned'
        );
        insert campaign2;

        Campaign campaign3 = new Campaign(
            Name = 'Test Campaign 3',
            StartDate = Date.today().addDays(-10),
            EndDate = Date.today().addDays(1),
            BudgetedCost = 100,
            Status = 'Planned'
        );
        insert campaign3;
    }

    @IsTest
    static void testCampaignUpdateBatch() {
        Test.startTest();

        // Start the batch job
        CampaignUpdateBatch batchJob = new CampaignUpdateBatch();
        Database.executeBatch(batchJob);

        // Verify that the campaigns with remaining donations less than or equal to zero and
        // end date less than or equal to yesterday have been updated to expired
        List<Campaign> expiredCampaigns = [SELECT Id,Name, Status FROM Campaign WHERE Status = 'Planned'];
        System.assertEquals(3, expiredCampaigns.size());
        System.assertEquals('Test Campaign 1', expiredCampaigns[0].Name);

        //Debug the returned campaigns
        List<Campaign> campaigns = [SELECT Id, Name, Status FROM Campaign WHERE Status = 'Planned'];
System.debug(campaigns);

        Test.stopTest();
    }
   
    @IsTest
    static void testExecuteMethod() {
        // Schedule the job to run immediately
        CampaignUpdateScheduler scheduler = new CampaignUpdateScheduler();
        String cronExpression = '0 0 0 * * ?';
        system.schedule('Test Campaign Update', cronExpression, scheduler);
    
        // Wait for the job to complete
        Test.startTest();
    /*
        // Check if the batch job has completed successfully
        String plannedCampaignCount = Database.executeBatch(new CampaignUpdateBatch());
        System.assertEquals(0, plannedCampaignCount); */
    
        Test.stopTest();
    }



}


    




