/*
* Implementation of Unit Test Class for SOAP API Outbound Callouts
* Step I : To Create a new Mock Response Apex Class which will implement WebServiceMock
* Step II:  Inside Mock Response class we will be implementing doInvoke method with bunch of predefined Method parameters
* Step III: Initialise Response Class of SOAP Utility/Service Class
* Step IV: Pass Dummy/ Fake Response values
* Step V:  Assosiate Mock Response ti our Unit Test method
* Step VI: Invoking SOAP Callout
* Step VII: System Assertion
*/

@istest
public with sharing class SoapApiOutboundCallout_Test {
    @istest
    public static void makeCalculatorCalloutSuccessTest(){
        //SoapApiOutboundCallout.makeMultiplication();
        //Assosiate Mock Response ti our Unit Test method
        Test.setMock(WebServiceMock.class, new SoapApiOutboundCalloutCalculatorMock());
        //Invoke SOAP Callout scneraio
        Test.startTest();
        Double result = SoapApiOutboundCallout.makeMultiplication();
        Test.stopTest();
        System.assertEquals(30.0, result, 'Mock Response returned should be matched');
    }
    @isTest

    public static void makeParkCalloutSuccessTest(){
        Test.setMock(WebServiceMock.class, new SoapApiOutoundCallloutParkMock());
        Test.startTest();
        List<String> parks = SoapApiOutboundCallout.makeParkCallout();
        Test.stopTest();
        System.assertEquals(3, parks.size(), 'We should be expecting 3');
        List<String> expectResult = new List<String> {'Park1','Park2','Park3'};
        System.assertEquals(expectResult, parks, 'We should be expecting 3 park dummy results Mosck Response');
    }
}