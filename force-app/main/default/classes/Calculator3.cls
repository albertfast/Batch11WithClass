public class Calculator3 {
    // method name = add
    // parameter = List<Integer>
    //return type = integer (return addition of all the elements in the list)
    public static integer add(List<Integer>listInt){
        // first take temp variable
        Integer returnInt = 0;
        for (integer eachInt : listInt) {
            System.debug('eachInt => ' + eachInt);
            returnInt += eachInt;
            System.debug('returnInt => '+ returnInt);
        }
        return returnInt;
    }
}
