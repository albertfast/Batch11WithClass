public class DmlDemo {
   public static void dmlInsertDemo_stndObj() {
    //create a new account record using apex code (DML)
    //Create new instance 
    Account acc = new Account();

    //2. set values to fields
    acc.Name = 'SoftInnovas';
    System.debug('Not inserted ' +acc);
    //dml.
    insert acc; //booom
    System.debug('Inserted' +acc); 
   }

   public static void dmlInsertDemo_cstmObj() {
    //1. create new instance
    Salesforce_project__c spNew = new Salesforce_project__c();
    //2.set field values
    spNew.project_name__c = 'Teach DML to batch 11';
    spNew.description__c = 'Everybody is doing great. Keep it up. ';
    //3 dml 
    //hmmm
    insert spNew;
    }

    public static void dmlUpdateDemo_1() {
        //create new instance
        Account acc = new Account();
        acc.Name = 'softInnovas';
        insert acc;
        //2. chance field values
        acc.Name= 'Salesforce Inc.';
        //update DML
        update acc;
        System.debug(acc);
    }
    public static void insertDemoStandartObj_2() {
        Contact cnn = new Contact();
        cnn.LastName= 'Betul Hocam';
        System.debug('Not insert ' +cnn);
        insert cnn;
        System.debug('after insert'+ cnn);
    }
    
    public static void dmlInsertDemo_cstmObj2() {
        //1. create new instance
        Salesforce_project__c spNew = new Salesforce_project__c();
        //2.set field values
        spNew.project_name__c = 'group 8';
        spNew.Status__c = 'New';
        //3 dml 
        //hmmm
        insert spNew;
        }
        public static void dmlUpdateDemo_3() {
            Account acc = [SELECT NAME FROM ACCOUNT WHERE NAME = 'SoftInnovas' limit 1];
   acc.Name = 'SoftInnovas Inc.';
   update acc;
   System.debug( ' updated acc: ' + acc);   
        }
    //retrieve using SOQL then update record
        public static void dmlInsertDemo_4() {
            //1. SOQL to get ONE account
           ACCOUNT acc = [SELECT id, name from account where name = 'SoftInnovas Inc.' LIMIT 1];
           //2. Create contact's instance
           Contact cnt = new Contact();
           //2.1 set contact fields as usual
           cnt.LastName = 'Biden';
           //3. set accountid field(relationship field)
           cnt.AccountId = acc.Id;
           //4. DML
           insert cnt;
           System.debug('contact record: ' + cnt);
        }

        public static void dmlUpdateDemo_2_Co() {
            //1. soql to get ONE Salesforce Project
            Salesforce_Project__c sp= [select id,name from Salesforce_Project__c order by CreatedDate DESC LIMIT 1];
            //2.Create ticket's instance
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Learn APEX';
            ST.Priority__c= 'High';
            st.Status__c= 'New';
            st.Requested_by_date__c= date.newInstance(2021, 12, 07);
            //3.IMPORTANT: set relationship
            st.Salesforce_Project__c = sp.Id;
            // st.Salesforce_Project__c = 'a00Do000001a8xmIAA'; If we not write sp, we can use just sales force project id like that one.
            //4. DML
            insert st;
            System.debug('Salesforce Ticket '+ st);
        }
        public static void dmlInsertMultiple_right() {
            List<account> listAcc = new list<account>();
    
            account acc1 = new account();
            acc1.Name = 'With For and Trigger bulk acc test A1';
            listAcc.add(acc1);
    
            account acc2 = new account();
            acc2.Name = 'With For and Trigger bulk acc test A2';
            listAcc.add(acc2);
    
            account acc3 = new account();
            acc3.Name = 'With For and Trigger bulk test acc A3';
            listAcc.add(acc3);
    
            insert listAcc;
        }

        public static void dmlInsertMultiple_right2() {
            List<account> listAcc = new list<account>();
    
            for (Integer i = 0; i < 155; i++) {
                account acc = new account();
                acc.name = 'Softinnovas v' + i;
                acc.Active__c = 'Yes';
                listAcc.add(acc);
            }
            //check if list is NOT empty
            if (!listAcc.isEmpty()) {
                insert listAcc; //execute this ONLY if LIST is NOT EMPTY.
            }
        }
    
        public static void dmlUpdateMultiple_right1() {
            list<account> listAcc = [select id, name, active__c from account ];
    
            list<account> updateAccount = new list<account>();
    
            for (account acc : listAcc) {
                if (acc.Active__c == 'Yes') {
                    acc.Name = acc.Name + ' via B.0';
                    updateAccount.add(acc);
                }
            }
            if (!updateAccount.isEmpty()) {
                update updateAccount;
            }
        }
        //List<Account> delAcc= [select id from account where name like '%B.0%'];
          
    }
