public class Cat {
    public string name;
    public string color;
    

    public Cat() {
        System.debug(' Consturctor called automatically');
    }

    public Cat(String n, string clr){
        name = n;
        color = clr;
        sleeping();
    }
    public void sleeping(){
        system.debug(name + ' is kinda sleeping. ');
    }
}
