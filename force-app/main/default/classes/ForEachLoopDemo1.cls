public  class ForEachLoopDemo1 {
    public static void iterateIntegerList() {
        List<Integer> listInteger = new List<Integer>();
        listInteger.add(10); // index=0
        listInteger.add(12); // index=1
        listInteger.add(5);  // index=2  
        listInteger.add(25); // index=3

        for(Integer eachInteger: listInteger){
            System.debug(eachInteger);
        }
    }
}
