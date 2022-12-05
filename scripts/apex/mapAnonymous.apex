Map<String,String> mapCntCurrency = new Map<String,String>();

mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('Spain', 'Euro');
mapCntCurrency.put('Netherland', 'Euro');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rupee');
mapCntCurrency.put('El Salvador', 'Bitcoin');
mapCntCurrency.put('Turkey', 'Lira');

System.debug(mapCntCurrency);

string IndiaCurrncy = mapCntCurrency.get('India');
string country = 'Turkey';
string countryCurrncy = mapCntCurrency.get(country);
System.debug('india currency is '+ indiaCurrncy);
System.debug(country + ' currency is '+ countryCurrncy);

// get all countries (keys)
Set<String> countrySet=mapCntCurrency.keySet();
System.debug('country set ==> '+ countrySet);
// get all countries (values)
List<String>currencyList= mapCntCurrency.values();
System.debug('Currency list ==> '+ currencyList);

Set<String> countries = mapCntCurrency.keySet();
for (string eachCountry : countries) {
    System.debug('* each country is '+ eachCountry);


    String eachCurrency = mapCntCurrency.get(eachCountry);
    System.debug('* each currency is '+ eachCurrency);
    System.debug(' Country is '+ eachCountry+ ' its currency is '+ eachCurrency);
}

System.debug(MapDemo.retrieveMonth(2));
System.debug(MapDemo.retrieveMonth(26));


            Map<String, List<Decimal>> lessonWithPoint = new Map<String, List<Decimal>>();
            List<Decimal> mathLesson = new List<Decimal>{90.8,85.3,92};
            lessonWithPoint.put('Mathematic ', mathLesson);
            List<Decimal> engLesson = new List<Decimal>{95.2,77.3,90};
            lessonWithPoint.put('English ', engLesson);
            List<Decimal> apexLesson = new List<Decimal>{95.5,89.9,98};
            lessonWithPoint.put('Apex ', apexLesson);
            List<Decimal> adminLesson = new List<Decimal>{75.3,80.3,88.8};
            lessonWithPoint.put('Admin ', adminLesson);
            List<Decimal> historyLesson = new List<Decimal>{45,85,80};
            lessonWithPoint.put('History ', historyLesson);

           // MapDemo.assigmentDegree(lessonWithPoint);
            MapDemo.avarageDegreeOfLesson(lessonWithPoint);
            MapDemo.avarageDegreeOfLesson4(lessonWithPoint);

