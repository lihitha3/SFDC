trigger OppTrg on Opportunity (before insert, before update)
{
    Opp_trg_hndlr handler = new Opp_trg_hndlr();
    
    if(Trigger.isBefore && Trigger.isInsert)
    {
        handler.beforeInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        handler.beforeInsert(Trigger.new);
    }
}