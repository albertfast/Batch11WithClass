public class ListDemo {
    public static String candidateList(integer i) {
        
        List<String> listCandidates = new List<string>();
        listCandidates.add('Mark');
        listCandidates.add('Jack');
        listCandidates.add('Musk');
        listCandidates.add('Joef');
        listCandidates.add('Hagi');
        System.debug(' list of candidates' + listCandidates);
        //String returnValue= listCandidates[i];
        String returnValue='';

        integer sizeOfList = listCandidates.size();
        if(i>=0 && i<sizeOfList){
            returnValue=listCandidates[i];
        } else {
            returnValue= ' No values found. Come on my man! ';
        }
        return listCandidates[i];
    }

   public static void randomIntegerList() {
    List<Integer> listInteger = new List<Integer>();
    listInteger.add(10); // index=0
    listInteger.add(12); // index=1
    listInteger.add(5);  // index=2  
    listInteger.add(25); // index=3
    listInteger.add(11); // index=4

    integer index3Value = listInteger.get(3); // we can write[3]
    System.debug('list of random integer is '+ listInteger );
    System.debug('list of index value is '+ index3Value);
    }
    public static void allCats(){
        List<cat> listCats = new list<cat>();
        //how to add cats in this list?
        Cat sfCat2 = new Cat('Leo', 'Orange');
        Cat sfCat3 = new Cat('Luna', 'Brown');
        Cat batch11Cat = new Cat('fluffykins', 'white');
        listCats.add(sfCat2);    
        listCats.add(sfCat3);    
        listCats.add(batch11Cat);//we add 'instances' of cat class.
        listCats.add(sfCat2);
        system.debug('cat list ' + listCats);
   }

}
