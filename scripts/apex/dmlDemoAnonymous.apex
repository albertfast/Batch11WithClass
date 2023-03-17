DmlDemo.dmlInsertDemo_stndObj();
DmlDemo.dmlInsertDemo_cstmObj();
DmlDemo.dmlUpdateDemo_1();
DmlDemo.insertDemoStandartObj_2();
DmlDemo.dmlInsertDemo_cstmObj2();
DmlDemo.dmlUpdateDemo_3();
DmlDemo.dmlInsertDemo_4();
DmlDemo.dmlUpdateDemo_2_Co();
DmlDemo.dmlInsertMultiple_right();
DmlDemo.dmlUpdateMultiple_right1();
DmlDemo.dmlInsertMultiple_right2();
delete [select id from account where name like '%With For and Trigger bulk test acc A3%'];

List<Account> accList = [select id, name from Account where name like '%Softinnovas' limit 50];
System.debug(accList.size());
delete accList;