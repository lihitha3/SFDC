public class AccountTgrHandler {
  
    public void beforeInsert(List<Account> newList){
        for(Account acc : newList){
            if(acc.Rating !='Hot'){
                acc.Rating.addError('Account should be Hot for a First Time');
            }
        }
    }
    
    public void beforeUpdate(Map<Id,Account> newMap , Map<Id,Account> oldMap){

       
        for(Id key : newMap.keyset()){
           // New Account
           Account new_account = newMap.get(key);
           // old Account
           Account old_account = oldMap.get(key);
           // terninory operator
           Boolean  nameChanged = new_account.Website != old_account.Website ? true : false;
            if(nameChanged){
                new_account.Website.addError('You are not allowed to change name');
            }   
    }        
    }
}