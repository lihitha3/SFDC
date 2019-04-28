public class rollupsumamry{
//accounts to be updated
                              //passing ids---
   private void updateaccount(set<id> accids){
        //get contacts from account---child to parent
      list<account> acc=[select id, Total_contacts__c,(select id,name from Contacts WHERE LeadSource='Web')
                        FROM Account WHERE ID IN:accids];
       //iterate account list to update contacts
       for(account a1:acc)
       {
          a1.Total_contacts__c=a1.Contacts.size();
           update acc;          
       }
    }
    //after insert
    public void afterinsert(map<id,contact> newmap){
        set<id> accids=new set<id>();//define ids creating for 1st time for counting we need
        for(contact con:newmap.values())
{        
            if(con.LeadSource=='web'&&con.accountid!=null)
            {
                accids.add(con.Accountid);//adding all contactids to set where lead=web
}
            if(accids.size()>0)
            {
                updateaccount(accids);//calling method by passing accids              
            }
        }        
    }
   //after update
  public void afterupdate(map<id,contact> newmap,map<id,contact> oldmap)
  {
      set<id> accid=new set<id>();
      for(id key:newmap.keyset())
      {
        Contact connew = newMap.get(key);
          Contact conold = oldMap.get(key);
          Boolean accchnaged = connew.AccountId != conold.accountId ? true : false;
            if(accchnaged){
               accid.add(connew.AccountId); 
                accid.add(conold.accountId); 
            }
        }
        if(accid.size() > 0){
            THIS.updateaccount(accid);
        }
  }    
  }