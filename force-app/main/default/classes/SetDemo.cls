public class SetDemo {
    public static void citySet(){
        Set<String>cities = new Set<String>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('TOKYO');
        
        System.debug('Cities are '+ cities);
    }
    public static void randomIntegerSet(){
        Set<Integer> setInt= new Set<Integer>();
        setInt.add(15);
        setInt.add(10);
        setInt.add(21);
        setInt.add(15);
        setInt.add(15);
        System.debug(setInt);
    }
    public static Set<Integer> setFromList(List<Integer>intList){
       Set<Integer> returnSet = new Set<Integer>();
       returnSet.addAll(intList);
       return returnSet;
    }
    public static Set<String> capitalizeSet( Set<String> setStr){
        Set<String> returnSet = new Set<String>();
        
        // iterate over each element of set
        //convert each element to uppercase
        //add in a newly created set
        for (string eachStr : setStr) {
            //eachStr ==> each element one by one from the set
            string tempstring = eachStr.toUpperCase();
            returnSet.add(tempstring);
        }
        return returnSet;
    }
}
