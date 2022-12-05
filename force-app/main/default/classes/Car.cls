//created a class.
public  class Car {
    //Public class variable
    public string carColor = ''; // It is public.
    public string carName;
    integer maxSpeed = 200; // It is private, we don't have to write private

    //created a method
    public void switchOn(){
        Datetime switchOnTime = Datetime.now();
        //THIS IS METHOD BODY.
        system.debug('starting the  car ' + switchOnTime);
        
    }
    public void drive() {
        System.debug('driving ' + carName + ' of color ' + carColor);
    }
    public void driveatMaxSpeed() {
        string drivingDescription = ' Driving ' + carName + ' at ' + maxSpeed + 'km/hr ';
        system.debug(drivingDescription);
    }
}

//SAVE CLASS
//right click. > sfdx deploy
//anonymous apex, we execute.