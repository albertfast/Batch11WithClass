public class LoopDemo {
    public void printIntWhile() {
        integer count = 1;
        while(count <=25){
            System.debug(count);
            count++;
        }
    }
    public void printNumbers(integer n){
        for (integer i=0; i<n; i++) {
            System.debug(i);
        }
    }
    public void printOddNumbers(integer startInt, integer endInt){
        //if startInt is bigger than endInt -> print. NOT ALLOWED Bro.
        if (startInt > endInt) {
            system.debug('NOT ALLOWED Bro/gal');
        } else {
            for (Integer i = startInt; i < endInt; i++) {
                system.debug('i is ' + i);
                integer remainder = math.mod(i, 2); 
                //modI == 1 then, odd number
                if (remainder == 1) {
                    system.debug(i + ' is ODD');
                }
            }
        }
        
   }
}