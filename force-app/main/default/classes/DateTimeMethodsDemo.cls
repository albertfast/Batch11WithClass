public class DateTimeMethodsDemo {
    public void calculateAgeInMonths() {
        //1. Today's date
        date dttoday = date.today();

        //2. Ahmet's Birthdate
        date aBdate = date.newInstance(1991, 1, 14);
        // calculate months difference in between two dates
        integer ageInMonths = aBdate.monthsBetween(dttoday);
        system.debug('Ahmet age in months is ' + ageInMonths); 
    }
    public void calculateAgeInDays() {
         //1. Today's date
         date dttoday = date.today();

    //2. Ahmet's Birthdate
        date aBdate = date.newInstance(1991, 1, 14); 

     // age in days
        Integer ageInDays = aBdate.daysBetween(dttoday);
        system.debug('Ahmet age in days is...' + ageInDays);
    }
    public void printSubscriptionEndDate(){
        Date subscriptionStartDate = date.today();

        Date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        system.debug('subscription ends on ' + subscriptionEndDate);

        integer endDateYear = subscriptionEndDate.year();
        system.debug('subscription end date YEAR is ' + endDateYear);

        integer endDateMonth = subscriptionEndDate.month();
        system.debug('subscription end date month is ' + endDateMonth);
   }
    public void printOfferEndDateTime(){
        Datetime dtNow = datetime.now();

        Datetime dtOfferEnd = dtNow.addHours(51);
        system.debug('offer end date & time ' + dtOfferEnd);

        date dateOfferEnd = dtOfferEnd.date();
        system.debug('date of offer end ' + dateOfferEnd);
   }
    public void birthDateToMilliSeconds(){
        datetime birthDate = datetime.newInstance(1991, 1, 14, 7, 30, 5);
        long longBirthDate = birthDate.getTime();
        system.debug('long birth date => ' + longBirthDate);
   }
   
}
