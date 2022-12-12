trigger AccountTrigger on Account (before insert, before update,after insert, after update) {
   
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
    }
   
   
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



