Trigger_Map t= new Trigger_Map();
Id z = t.InsertSF_Project();
System.debug('Project id is ==> '+ z);
t.UpdateSF_Project(z, 'UPDATED Trigger Project');

