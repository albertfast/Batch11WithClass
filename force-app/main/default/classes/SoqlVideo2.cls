public class SoqlVideo2 {
    public static void fetchOppsAndAccount() {
        List<Opportunity> listOfOpp = [SELECT Id, Amount, AccountId, StageName, Name, account.name, account.phone, account.type, account.industry FROM Opportunity WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost'];
        System.debug('List of opp => '+ listOfOpp);
        for (Opportunity opp : listOfOpp) {
            System.debug(opp);
            System.debug('Opp name is '+ opp.Name+ ', amount and stage name of opp is ==> '+ opp.Amount+ ' & '+ opp.StageName);
            if (opp.AccountId != null) {
                System.debug('Bu opp nin bagli oldugu account '+ opp.Account.Name+ ', phone : '+ opp.account.phone+ ', Industry: '+ opp.account.Industry);
            } else {
                System.debug('Bu opp nin bir accounta bagli degil');
            }
        }
    }
}