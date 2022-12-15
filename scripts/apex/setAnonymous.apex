SetDemo.citySet();
SetDemo.randomIntegerSet();

List<Integer> listInteger = new List<Integer>();
    listInteger.add(10); // index=0
    listInteger.add(12); // index=1
    listInteger.add(5);  // index=2  
    listInteger.add(25); // index=3
    listInteger.add(11); // index=4

   System.debug('list '+ listInteger);
   Set<Integer> setInt= SetDemo.setFromList(listInteger);
   System.debug(' set => '+ setInt);

    Set<String>cities = new Set<String>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('TOKYO');
        Set<String> upperCaseSet= SetDemo.capitalizeSet(cities);
        System.debug(upperCaseSet);


List<String> days = new List<String>();
days.add('Monday');
days.add('Tuesday');
days.add('Wednesday');
days.add('Thursday');
days.add('Friday');
days.add('Saturday');

system.debug(days);

days.add('Sunday');

system.debug(days);

days.sort();
System.debug('After sort' +days);

System.debug('How mandy days we have in this list '+days.size());

System.debug(days.get(3));

System.debug(days.contains(' Is day contain this day? ' +'Saturday'));
System.debug('Is the List Empty? ' +days.isEmpty());

Boolean isContainsSali = (!days.contains('Sali'));
System.debug(' Not is contains '+ isContainsSali);

Set<String>dayNew= new Set<String>();
//dayNew.addAll(days);
System.debug(dayNew);
Set<String>upperCaseDay= SetDemo.capitalizeSet(dayNew);
System.debug(upperCaseDay);
System.debug('How mandy days we have in this set '+dayNew.size());
System.debug('Is set contains Monday? '+dayNew.contains('Monday'));
dayNew.clear();
System.debug(dayNew);
System.debug('After clear method the set size is ==> '+dayNew.size());
