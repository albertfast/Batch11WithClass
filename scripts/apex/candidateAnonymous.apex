Candidates.companyName = 'SoftInnovas';
Candidates.printCandidateInfo();
System.debug(' Start count of candidates ' + Candidates.countCandidates);

Candidates c1 = new Candidates();
//Candidates.countCandidates++;
c1.name = ' Ahmet ';
c1.gender = ' male ';
c1.printCandidate();

Candidates c2 = new Candidates();
//Candidates.countCandidates++;
c2.name = ' Eric ';
c2.gender = ' male ';
c2.printCandidate();

Candidates.companyName = 'Vandelay Industries';

Candidates c3 = new Candidates();
//Candidates.countCandidates++;
c3.name = ' Kutur kutur ';
c3.gender = ' male ';
c3.printCandidate();
System.debug('----------');
c1.printCandidate();
System.debug('----------');
c2.printCandidate();

Candidates c4 = new Candidates();
c4.name = ' Pamuk ';
c4.gender = ' Female ';
c4.printCandidate();

Candidates c5= new Candidates(' newman ',' male ');
c5.printCandidate();

Candidates.printCandidateInfo();
System.debug(' End count of candidates ' + Candidates.countCandidates);