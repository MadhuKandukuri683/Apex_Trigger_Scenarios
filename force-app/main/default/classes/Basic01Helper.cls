public with sharing class Basic01Helper {
    public static void InsertNewContacts(List<Contact> newContacts) {
        
        Set<Id> AccountIds = new Set<Id>();
        for(Contact cnt:newContacts){
            if(cnt.AccountId!=null){
                AccountIds.add(cnt.AccountId);
            }
        }

        Map<Id,Account> accountMap = new Map<Id,Account>([Select id,Industry from account where Id in :AccountIds]);

        for(Contact cnt: newContacts){

            Account acc = accountMap.get(cnt.AccountId);
            if(acc!=null && acc.Industry=='Banking'){
                cnt.Description = 'Banking Client';
            }
        }

    }

}