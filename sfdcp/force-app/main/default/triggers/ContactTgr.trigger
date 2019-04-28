trigger ContactTgr on Contact (after Insert , after Update) {
  //ContactTgrControl handler = new ContactTgrControl();
    rollupsumamry handler = new rollupsumamry();
     if(Trigger.isInsert && Trigger.isAfter){
        handler.afterinsert(Trigger.newmap);
    }
     if(Trigger.isupdate && Trigger.isAfter){
        handler.afterupdate(Trigger.newMap,Trigger.oldMap);
    }

}