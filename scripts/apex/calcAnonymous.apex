Calculator c2 = new Calculator();
string returnC2=c2.printAndReturnMessage('print this asap');
system.debug(returnC2);

integer c2Sum1 = c2.add(10,25);
system.debug('c2Sum1 is ' + c2Sum1);
integer c2Sum2=c2.add(25,55);
system.debug('c2Sum2 is ' + c2Sum2);
integer x = 42;
integer y = 34;
integer c2Sum3 = c2.add(x,y);
system.debug('c2Sum3 is ' + c2Sum3);
integer c2Sum4 = c2.add(15,35,20);
system.debug('c2Sum4 is ' + c2Sum4);

Date date1 = Date.newInstance(2020, 6, 22);
boolean date1LP = c2.leapYearCheck(date1);
system.debug(' date 1 is leap year? ' + date1LP);


Calculator c1 = new Calculator();
c1.welcomeMessage();
//1.
string message = ' print this message ';
c1.printNewMessage(message);
//2.
c1.printNewMessage('now print this');
//3.
//integer msg = 15;
//c1.printNewMessage(msg);



