trigger AccountTgr on Account (after insert,after update) {
    AccountTgrHandler handler = new AccountTgrHandler();
    if(Trigger.isInsert && Trigger.isafter){
        handler.beforeInsert(trigger.new);
    }
    if(Trigger.isafter && Trigger.isUpdate){
        handler.beforeUpdate(Trigger.newMap ,Trigger.oldMap);
    }
   

}