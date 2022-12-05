public class Calculator {
   //void --> return type
   //() --> parameteres
    public void welcomeMessage() {
        system.debug(' welcometo apex calc ');
    }

    public void printNewMessage(string msg) {
        system.debug(msg);
    }
    // return string, append '...ok cool' to parameter
    public string printAndReturnMessage(string msg) {
        string returnString = msg + '... OK cool. ';
        return returnString;
    }
    public Integer add(integer a, integer b) {
        integer sum = a + b;
        return sum;
    }

    public Integer add(integer x, integer y, integer z) {
        integer sum = x + y + z;
        return sum;
    }
    //parameter is DATE
    //return type is boolean
    public boolean leapYearCheck(date dt) {
        integer year = dt.year(); //use built-in method.
        boolean lp = date.isLeapYear(year);
        return lp;
    }
}
