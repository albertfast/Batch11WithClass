trigger AssetTrigger on Asset (before insert,before update) {
if (trigger.isBefore && trigger.isUpdate) {
        Assethandler.Assethandlerupdate(trigger.new,trigger.old ,trigger.newMap ,trigger.oldMap );
 
}
 if (trigger.isBefore &&trigger.isInsert) {
    
 Assethandler.Assethandlerupdate(trigger.new,trigger.old ,trigger.newMap ,trigger.oldMap );
    
} 
}