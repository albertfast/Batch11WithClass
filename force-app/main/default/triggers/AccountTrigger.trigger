trigger AccountTrigger on Account (before insert, before update,after insert, after update) {

    /*
    if (trigger.isBefore && trigger.isInsert) {
        AccountTriggerHandler.tryException(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
       */
   
    /*
    if (trigger.isAfter && trigger.isUpdate) {
        Map<Id,Account> accNewMap = trigger.newMap;
        AccountHelper.checkSizeConOnAcc(accNewMap.keySet());
    }
    if ( trigger.isAfter && trigger.isInsert) {
        Map<Id,Account> accNewMap = trigger.newMap;
        AccountHelper.checkSizeConOnAcc(accNewMap.keySet());
    } */
   
    /*
    if (trigger.isAfter && trigger.isInsert) {
        AccountHandler_assg.makeContact(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
     */
    /*
    if (trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        //Here we call handler method to update all contacts VIP
        AccountTriggerHandler.updateVIPforContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        AccountQueueableExample aq = new AccountQueueableExample(trigger.new);
        id jobId = system.enqueueJob(aq);
    }
        */
  
  
  
  
  /*  for (account eachAcc : Trigger.new) {
           
            if (trigger.isInsert && eachAcc.Active__c == 'YES') {
                //Just set field Value
                eachAcc.Description= 'Account is now active. Enjoy! ' ;
            }
            //if account is updated
              //check if active field is changed from not yes to yes, then update description
              if (trigger.isUpdate) {
                Id accId = eachAcc.Id;
                //get old account using OldMap
                Account oldAccount = Trigger.oldMap.get(eachAcc.Id);
                //get new account using NewMap
                Account newAccount = Trigger.newMap.get(eachAcc.Id);
                  //oldAccount.Active__c != newAccount.Active__c
                if (eachAcc.Active__c == 'Yes' && oldAccount.Active__c != newAccount.Active__c) {
                    eachAcc.Description= 'Account is now active. Enjoy! ' ;
                }
              
              }
        }*/
  
    /* if (trigger.isAfter && trigger.isUpdate) {
    System.debug('after update trigger');

    map<id, Account> accTriggerOldMap = trigger.oldMap; //map of old records, id is key
    map<id, Account> accTriggerNewMap = trigger.newMap; //map of new records, is is key
    set<id> accountIds = accTriggerNewMap.keySet(); //all the IDS.
    integer countWebsite = 0;

    for (Id eachId : accountIds) {
        //get New account value from NewMap- id is same in newmap and oldmap
        account newAcc = accTriggerNewMap.get(eachId);
        string newWebsite = newAcc.Website;
        System.debug('** newWebsite ==> '+ newWebsite);
        //get OLD account value from OldMap
        account oldAcc = accTriggerOldMap.get(eachId);
        string oldWebsite = oldAcc.Website;
        System.debug('** oldWebsite ==> '+ oldWebsite);
        if (newWebsite != oldWebsite) {
            system.debug('Account is ' + newAcc.Name + ', website changed to ' + newwebsite);
            countwebsite++;
        }
       
    }
    system.debug('website updated for # of accounts => ' + countwebsite);
} */
    

   
   
   
    /* List<account> accTriggerOld = trigger.old; //list of old records
    List<account> accTriggerNew = trigger.new; //list of new records
    map<id, account> accTriggerOldMap = trigger.oldMap; //map of old records, id is key
    map<id, account> accTriggerNewMap = trigger.newMap; //map of new records, id is key

    if (Trigger.isAfter && Trigger.isUpdate) {

        //old account name and new account name using ONE for loop.
        
        //get set of id using map.
        set<id> accountIds = accTriggerNewMap.keySet();
        for (Id eachId : accountIds) {
            //get NEW account value from NewMap - id is same in newmap and oldmap
            account newAcc = accTriggerNewMap.get(eachId);
            system.debug('NEW Acc Name is ' +  newacc.Name);
            //get OLD account value from OldMap
            account oldAcc = accTriggerOldMap.get(eachId);
            system.debug('Old Acc Name is ' +  oldacc.Name);
        }
    } */

    /*
    //what elements we have in these maps.
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert old => ' + accTriggerOld);
        system.debug('before insert new => ' + accTriggernew);
        system.debug('before insert old map => ' + accTriggerOldMap);
        system.debug('before insert new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert old => ' + accTriggerOld);
        system.debug('after insert new => ' + accTriggernew);
        system.debug('after insert old map => ' + accTriggerOldMap);
        system.debug('after insert new map => ' + accTriggernewMap);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before update old => ' + accTriggerOld);
        system.debug('before update new => ' + accTriggernew);
        system.debug('before Update old map => ' + accTriggerOldMap);
        system.debug('before Update new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after update old => ' + accTriggerOld);
        system.debug('after update new => ' + accTriggernew);
        system.debug('after Update old map => ' + accTriggerOldMap);
        system.debug('after Update new map => ' + accTriggernewMap);
    } */
    /*
    map<id, account> accTriggerOldMap = trigger.oldMap;
    map<id, account> accTriggerNewMap = trigger.newMap;
    //what elements we have in these maps.
    if (trigger.isBefore && trigger.isInsert) {
        System.debug('Before insert old map => '+ accTriggerOldMap);
        system.debug('before insert new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert old map => ' + accTriggerOldMap);
        system.debug('after insert new map => ' + accTriggernewMap);
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before Update old map => ' + accTriggerOldMap);
        system.debug('before Update new map => ' + accTriggernewMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after Update old map => ' + accTriggerOldMap);
        system.debug('after Update new map => ' + accTriggernewMap);
    } */
   /* if (trigger.isAfter) {
        List<Account> accTriggerNew = trigger.new;//new (updated) values of records
        set<id> setIds = new set<id>(); //add all IDS of accounts which are inserted/updated
        for (account newAcc : accTriggerNew) {
            Id accId = newAcc.id;
            setids.add(accId); // adding ID to newly created set.
        }
        System.debug(setids);

    } */


   /* if (trigger.isBefore && trigger.isUpdate) {
        List<Account> accTriggerOld = trigger.old;//old (previous) values of records
        for (account oldAcc : accTriggerOld) {
            System.debug('Old acc name is ==> '+ oldAcc.Name+ ', old acc id => '+ oldAcc.Id);
        }
        List<Account> accTriggerNew = trigger.new;//new (updated) values of records
        for (account newAcc : accTriggerNew) {
            System.debug('New acc name is ==> '+ newAcc.Name+ ', new acc id => '+ newAcc.Id);
        }
    } */
   /*
    if (trigger.isBefore&& trigger.isInsert) {
        System.debug('account BEFORE insert trigger.old -> '+ trigger.old);
    }
    if (trigger.isAfter && trigger.isInsert) {
        System.debug('account AFTER insert trigger.old -> '+ trigger.old);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        System.debug('account before Update trigger.old -> '+ trigger.old);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        System.debug('account AFTER Update trigger.old -> '+ trigger.old);
    } */
   
   
    /* list<account> accTriggerNew = trigger.new;
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('BEFORE UPDATE new record ==> '  + accTriggerNew);
        system.debug('BEFORE UPDATE  new accounts size ==> ' + accTriggerNew.size());

        for (account eachAcc : accTriggerNew) {
            system.debug('BEFORE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
        }
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('AFTER newly UPDATE record ==> '  + accTriggerNew);
        system.debug('AFTER newly UPDATE accounts size ==> ' + accTriggerNew.size());

        for (account eachAcc : accTriggerNew) {
            system.debug('AFTER each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
        }
    } */
   
    /*
        list<account> accTriggerNew = trigger.new;
        if (Trigger.isBefore && Trigger.isInsert) {
            system.debug('BEFORE INSERT new record ==> '  + accTriggerNew);
            system.debug('BEFORE INSERT  new accounts size ==> ' + accTriggerNew.size());
    
            for (account eachAcc : accTriggerNew) {
                system.debug('BEFORE each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
            }
        }
        if (Trigger.isAfter && Trigger.isInsert) {
            system.debug('AFTER newly inserted record ==> '  + accTriggerNew);
            system.debug('AFTER newly inserted accounts size ==> ' + accTriggerNew.size());
    
            for (account eachAcc : accTriggerNew) {
                system.debug('AFTER each acc id is ' + eachAcc.Id + ', each acc name is ' + eachacc.Name);
            }
        } */
    }

    
    
    
    
    /*
    List<Account> accTriggerNew = trigger.new;
    if (trigger.isAfter && trigger.isInsert) {
        System.debug('newly inserted record ==>'+ accTriggerNew);
        System.debug('newly inserted accounts size ==> '+ accTriggerNew.size());

        for (account eachAcc : accTriggerNew) {
            System.debug('each acc id is '+ eachAcc.Id+ ', each acc name is '+ eachAcc.Name);
        }
    } */

  
  
  
  /*
    if (trigger.isInsert && trigger.isAfter) {
    System.debug('account after insert trigger called. ');
   }
   if (trigger.isInsert && trigger.isBefore) {
    System.debug('account before insert trigger called');
   }
   
   if (trigger.isUpdate && trigger.isBefore) {
    System.debug('account before update trigger called. ');
   }
   if (trigger.isUpdate && trigger.isAfter) {
    System.debug('account after update trigger called');
   }
  */
   
   /* if (Trigger.isBefore) {
        System.debug('account before insert trigger called.');
    }
    if (Trigger.isUpdate) {
        System.debug('account before update trigger called');
    } */

/*
    if (Trigger.isBefore) {
    System.debug('account before insert trigger called.');
}
if (Trigger.isAfter) {
    System.debug('account after insert trigger called');
}
*/



