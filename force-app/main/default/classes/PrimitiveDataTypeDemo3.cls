public class PrimitiveDataTypeDemo3 {
        public void printNewDate() {
            system.debug( ' Create new data instance ');

            Date newDate = Date.newInstance(1995, 2, 2);
            system.debug('new date is ' + newDate);

            Date newDate2 = Date.newInstance(2018, 11, 25);
            system.debug('new date2 is ' + newDate2);

            Date todayDate = date.today();
            system.debug(' today \'s date is ' + todayDate);

            Time newTime = time.newInstance(10, 51, 35, 12);
            system.debug(' the time is ' + newtime);

            Time meTime = time.newInstance(16, 18, 45, 15);
            system.debug(' the time is ' + metime);
        }
        public void printNewDateTime(){
            date newDate = date.today();
            time newTime = time.newInstance(1, 1, 15, 55);

            //1. Create new DATETIME using date and Time.
            datetime dt1= Datetime.newInstance(newDate, newTime);
            system.debug(' dt1 is ' + dt1);

            //2. create datetime using YEAR, MONTH ,DAY => 
            // time will be user's profile time zone mignight
            datetime dt2 = datetime.newInstance(2000,5,16);
            system.debug(' dt2 is ' + dt2);
        }
        public void printTime(){
            Time myTime = time.newInstance(1, 1, 15, 55);
            system.debug('mytime is ' + myTime);
    
            Time meTime = time.newInstance(16, 18, 45, 15);
            system.debug('meTime is ' + meTime);
            
        }
    }
