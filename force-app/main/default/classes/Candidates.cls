public  class Candidates {
   public string name;
   public string gender;
   public static string companyName;
   public static integer countCandidates = 0;

   public Candidates(){
      countCandidates++;
   }

   public void printCandidate(){
    System.debug(' Candidate name is ' + Name);
    System.debug(' Candidate Gender is ' + Gender);
    System.debug(' Company name  is ' + CompanyName);
   }

   public static void printCandidateInfo(){
    System.debug('company name is '+ companyName);
    // we cannot access non-static members inside static method.
    //System.debug('name is' + name);
   }

   public Candidates(string n,string g){
      this();
      this.name=n;
      this.gender=g;
   }
}
