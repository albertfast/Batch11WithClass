public  class MapDemo {
    public static String retrieveMonth(integer m) {
        String monthName = '';
        Map<Integer,String> mapMonth = new Map<Integer,String>();
        mapMonth.put(1, 'January');
        mapMonth.put(2, 'February');
        mapMonth.put(3, 'March');
        mapMonth.put(4, 'April');
       
        mapMonth.put(5, 'May');
        mapMonth.put(6, 'June');
        mapMonth.put(7, 'July');
        mapMonth.put(8, 'August');

        mapMonth.put(9, 'September');
        mapMonth.put(10, 'October');
        mapMonth.put(11, 'November');
        mapMonth.put(12, 'December');

        monthName = mapMonth.get(m);

        Boolean keyExist = mapMonth.containsKey(m);
        if (keyExist) {
            monthName=mapMonth.get(m);
        }else {
            monthName= 'No such month exist. Please behave! ';
        }
        return monthName;
    }
        public static void assigmentDegree (Map<String, List<Decimal>> lessonWithPoint2) {          
            System.debug(lessonWithPoint2);
            System.debug('Mathematic last 3 exam result is ==> '+ lessonWithPoint2.get('Mathematic '));  
            //lessonWithPoint.keySet() ==> mapin icinden set degerlerini bize veriyor.
            //lessonWithPoint.get(eachLesson) ==> mapin icinden bize her bir dersin degerlerini veriyor.
            for (string eachLesson : lessonWithPoint2.keySet()) {
                System.debug(eachLesson + ' dersinin 2 vize ve bir final notu ==> '+ lessonWithPoint2.get(eachLesson));
            }
        }
            public static void avarageDegreeOfLesson(Map<String, List<Decimal>> lessonWithPoint3) {
                Map<String,Double> lessonAvarage = new Map<String,Double>();
                for (string eachLesson : lessonWithPoint3.keySet()) {
                    System.debug(eachLesson + ' dersinin 3 sinav sonucu ==> '+ lessonWithPoint3.get(eachLesson));
                    Double sum = 0;
                    for (double exResult : lessonWithPoint3.get(eachLesson)) {
                        sum += exResult;
                    }
                        Double avgExam = sum/ lessonWithPoint3.get(eachLesson).size();
                        lessonAvarage.put(eachLesson, avgExam);
                }
                    System.debug(' Dersler ve 3 sinavin ortalamasi ==> '+ lessonAvarage);
            }
            public static void avarageDegreeOfLesson4(Map<String, List<Decimal>> lessonWithPoint3) {
                List<string> upTo75Degree= new List<string>(); 
                List<string> downTo75Degree= new List<string>(); 
                Map<String,Double> lessonAvarage = new Map<String,Double>();
                for (string eachLesson : lessonWithPoint3.keySet()) {
                    System.debug(eachLesson + ' dersinin 3 sinav sonucu ==> '+ lessonWithPoint3.get(eachLesson));
                    Double sum = 0;
                    for (double exResult : lessonWithPoint3.get(eachLesson)) {
                        sum += exResult;
                    }
                        Double avgExam = sum/ lessonWithPoint3.get(eachLesson).size();
                        if (avgExam<75) {
                            downTo75Degree.add(eachLesson);
                        } else {
                            upTo75Degree.add(eachLesson);
                        }
                        lessonAvarage.put(eachLesson, avgExam);
                }
                    System.debug(' Dersler ve 3 sinavin ortalamasi ==> '+ lessonAvarage);
                    System.debug('75 puanin altindaki dersler ==> '+ downTo75Degree + '75 puanin ustundeki dersler ==> ' + upTo75Degree);
            }
}
