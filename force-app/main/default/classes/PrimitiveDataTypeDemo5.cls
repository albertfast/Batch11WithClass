public class PrimitiveDataTypeDemo5 {
    public void printNewDateTime(){
        Datetime dt3 = Datetime.newInstance(2021, 5, 15, 9, 5, 40);
        system.debug('dt3 is ' + dt3);

        Datetime dt4_1 = datetime.newInstance(658923);
        system.debug('dt4_4 is ' + dt4_1);
        
        Long LongTime = 1487954621154L; // milliseconds from 1970 jan 1 000000
        Datetime dt4 = Datetime.newInstance(longtime);
        system.debug('Dt4 is' + dt4);

        datetime dt6 = datetime.now(); // current time
        system.debug('dt6 is ' + dt6); // gmt time

        datetime dt5 = datetime.newInstanceGmt(1998, 8, 4, 5, 1, 4);
        system.debug('dt5 is ' + dt5);
    }
}

