public class Opp_trg_hndlr
{

    public void beforeInsert(List<Opportunity> NewList)
    {
       List<Task> tk = new List<Task>();
       for(Opportunity opp : NewList)
       {
           if(opp.StageName == 'closed Won')
           {
              tk.add(new Task(Subject = 'Follow up Test task' , WhatID = opp.Id));
           }
       }
        insert tk;
    }

}