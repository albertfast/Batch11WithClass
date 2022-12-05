ListDemo.allCats();
String valueAt2= ListDemo.candidateList(2);
system.debug(valueAt2);
String valueAt5= ListDemo.candidateList(5);
system.debug(valueAt5);


ListDemo.randomIntegerList();

List<String> listStr= new List<String>();
if(listStr.isEmpty()){
    system.debug('List is empty. okay? ');
}

 List<Integer> listInteger = new List<Integer>();
    listInteger.add(10); // index=0
    listInteger.add(12); // index=1
    listInteger.add(5);  // index=2  
    listInteger.add(25); // index=3
    listInteger.add(11); // index=4
    system.debug('before sort -> ' +listInteger);
    listInteger.sort();
    System.debug('after sort ->'+ listInteger);
