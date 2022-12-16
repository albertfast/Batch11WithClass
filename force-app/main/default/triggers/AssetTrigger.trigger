trigger AssetTrigger on Asset (before insert,before update,after insert, after update) {
if (trigger.isBefore) {
    if (trigger.isUpdate) {
        Assethandler.Assethandlerupdate(trigger.new,trigger.old ,trigger.newMap ,trigger.oldMap );
    }
}
if (trigger.isBefore) {
    if (trigger.isInsert) {
        Assethandler.Assethandlerupdate(trigger.new,trigger.old ,trigger.newMap ,trigger.oldMap );
    }
}
}