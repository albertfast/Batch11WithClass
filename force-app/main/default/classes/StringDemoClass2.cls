public  class StringDemoClass2 {
    public void stringMethod1() {
       String sessionDescription = ' learning string methods in apex language. ';
        system.debug(sessionDescription);

        integer lengthOfStr = sessionDescription.length();
        system.debug(' length of session description is ' + lengthOfStr);

        String capsSessionDescription = sessionDescription.toUpperCase();
        system.debug(' in CAPS ->' + capsSessionDescription);

        //3. Check if string contains 'apex'
        boolean apexContains = sessionDescription.contains('apex');
        system.debug(' contains apex???? ' + apexContains);

        //3.2 Check if string contains 'Apex'
        boolean apexContains2 = sessionDescription.contains('Apex');
        system.debug(' contains apex???? ' + apexContains2);

        //3.3 Check if string contains 'apex'
        boolean apexContains22 = sessionDescription.containsIgnoreCase('Apex');
        system.debug(' contains apex???? ' + apexContains22);
     
     
        //Check if string contains 'Salesforce'
        boolean sfContains = sessionDescription.contains('Salesforce');
        system.debug(' contains apex???? ' + sfContains);

        
    }
}
