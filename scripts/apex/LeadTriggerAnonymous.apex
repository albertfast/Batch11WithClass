List<Lead> leadList = new List<Lead>();
    for (Integer i = 1; i < 6; i++) {
        Lead myLead = new Lead();
        myLead.LastName= 'Lead ' +i;
        myLead.Company= 'Power ' +i;
        myLead.Status= 'Open-Not Contacted';
        leadList.add(myLead);
    }
    
    if (!leadList.isEmpty()) {
        insert leadList;
    }
