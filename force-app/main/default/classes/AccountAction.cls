public with sharing class AccountAction {

    @InvocableMethod(
        label='Update Account Revenue'
        description='Summation of Child Opporunity Amount dispalyed on Parent Account Anuual Revenue'
        category='Account'
    )
    public static void updateAccountRevenue(List<Id> oppIds){
        // Fetch Parent Account Information from OppIds using SOQL
        // NOTE: Use the WITH SECURITY_ENFORCED clause to enable field- and object-level security permissions checking for SOQL Queries in Apex code
        Opportunity newlyCreatedOpp = [SELECT AccountId FROM Opportunity WHERE Id =: oppIds[0] WITH SECURITY_ENFORCED LIMIT 1];
        Id parentAccountId = newlyCreatedOpp.AccountId;
        // Fetch all Child Opportunity under that Parent Account using SOQL
        // Create a totalAmount variable
        List<Opportunity> childOpps = [SELECT Amount FROM Opportunity WHERE AccountId =: parentAccountId WITH SECURITY_ENFORCED];
        Decimal totalAmount = 0;
        // Iterate over all Child opporunity and add up Amount value
        for(Opportunity opp : childOpps){
            // Amount is not null and have some value then only do the summation
            if(opp.Amount != null && opp.Amount > 0) {
                totalAmount = totalAmount + opp.Amount;
            }
        }
        // Update Parent Account's Annual revenue field with totalAmount value
        // NOTE: Creating an instance of Sobject Type Account
        // Alternative Line: Account parentAcc = new Account(Id = parentAccountId, AnnualRevenue = totalAmount);
        Account parentAcc = new Account();
        parentAcc.Id = parentAccountId;
        parentAcc.AnnualRevenue = totalAmount;
        update parentAcc;
    }
}   

/**
* Annotate the method with @InvocableMethod
* The invocable method must be static and public or global
* Only one method in a class can have the invocable method annotation
* Triggers can't reference invocable methods
** Invocable method doesn't accept more than one argument as a method parameter
* Other annotations cant be used with invocable method annotation
 */

 /* public class A {

    @InvocableMethod
    public static randomMethod(List<B> inputs){
        for(B obj : inputs){
            System.debug(obj.Name);
        }
    }

    // Inner Wrapper Class to hold collection of multiple data items
    public class B {
        @InvocableVariable(label='Input Name' description='')
        public String Name;
        @InvocableVariable(label='Input Class' description='')
        public Integer ClassId;
        @InvocableVariable(label='Input Roll No' description='')
        public Integer RollNum;
    }
}  */