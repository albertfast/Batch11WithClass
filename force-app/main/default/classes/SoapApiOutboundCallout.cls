/**
 * 
 * SOAP (Simple Object Access Protocol) - Earlier framework of doing Web Communication/Integration, Secure way of data transfering, XML Messaging Format only
 * Outbound Callout using SOAP Api - 4 Steps of Implementation
 * Step 1 : Create Remote Site Setting - to whitelist Domain
 * Step 2 : WSDL (Web Service Description Language) - Get WSDL from External System
 *   a. endpoint Url, Features available, Input parameters (Request), Response -XML format
 *       i.Identify Inner Class - ImplementationPort
 *       ii. Features available- (Methods)
 * Step 3: Convert WSDL to Apex Class using Salesforce framework
 * Step 4: Use/Consume/Invoke the Soap Apex Class to make callout
 */

//Step 4: Use/Consume/Invoke the Soap Apex Class to make callout 
public with sharing class SoapApiOutboundCallout {

      /**
         * SOAP API Callout to Calculator Heroku App to do multiplication
         * 
         */

    public static Double makeMultiplication() {
        CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort();
        Double num1 = 8.0;
        Double num2 = 2.0;
        Double result = calc.doMultiply(num1, num2);
        System.debug('Calculatore Response for Multiply Feature is : ' + num1 + ' * ' + num2);
        System.debug('Calculatore Response for Multiply Feature is : ' + result);
        return result;
    }
    public static Double makeDivision() {
        CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort();
        Double num3 = 8.2;
        Double num4 = 2.2;
        Double result2 =calc.doDivide(num3, num4);
        System.debug('Calculatore Response for Divide Feature is : ' + num3 + ' / ' + num4);
        System.debug('Calculatore Response for Divide Feature is : ' + result2);
        return result2; 
    }
    public static Double makeAddition() {
        CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort();
        Double num3 = 15.2;
        Double num4 = 26.8;
        Double result2 =calc.doAdd(num3, num4);
        System.debug('Calculatore Response for Addition Feature is : ' + num3 + ' + ' + num4);
        System.debug('Calculatore Response for Addition Feature is : ' + result2);
        return result2; 
    }
    public static Double makeSubstraction() {
        CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort();
        Double num3 = 120;
        Double num4 = 2;
        Double result2 =calc.doSubtract(num3, num4);
        System.debug('Calculatore Response for Substraction Feature is : ' + num3 + ' - ' + num4);
        System.debug('Calculatore Response for Substraction Feature is : ' + result2);
        return result2; 
    }
        
    
        //SOAP API Callout to Park Heroku App to get list of Park names based om Country
        public static List<String>  makeParkCallout() {
            ParkSOAPApex.ParksImplPort park = new  ParkSOAPApex.ParksImplPort();
            String inputCountry = 'India';
            List<String> parksNames = park.byCountry(inputCountry);
            System.debug('Park SOAP API Response for Country-wise Feature is : ' + parksNames);
            return parksNames;
        }
}