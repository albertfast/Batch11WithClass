//create object of car class.
//we also call it INSTACE of class.

//ClassName
System.debug('BMW is created');
Car bmw= new car(); 
bmw.carName = ' X3';
bmw.carColor = 'silver';
//new instance created, and stored in a variable named 'bmw'
bmw.switchOn();
System.debug('bmw -> ' + bmw);
bmw.drive();
bmw.driveatMaxSpeed();
System.debug('BMW is done');

System.debug('Tesla is created');
car tesla = new car();
tesla.carName= ' Model Y';
tesla.carColor = 'White';
tesla.switchOn();
System.debug(' Tesla car color -->' + tesla.carColor);
System.debug('Tesla -->' + tesla);
tesla.drive();
tesla.driveatMaxSpeed();
System.debug('Tesla is done');

car toyota = new car();
toyota.switchOn();
toyota.drive();