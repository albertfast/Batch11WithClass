@isTest //class becomes test class
public class Calculator2Test {
    @isTest //Method becomes test method
    public static void testMessage() {
        //we want to test our calculator class's methods.
        Calculator2.welcomeMessage();
        //can we calll parameterized from test class?
        Calculator2.printNewMessage('this is from test class');
       
    }
    @isTest
    public static void addTest1() {
        integer i= 10;
        integer j= 15;
        integer sum1 = Calculator2.add(i, j);
        //sum1 should be 25
        System.assertEquals(25, sum1);
    }
    @isTest 
    public static void addTest2() {
      
        integer sum2 = Calculator2.add(10, 15, 25);
        //sum2 should be 50
        System.assertEquals(50, sum2);
    }

}
