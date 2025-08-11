public with sharing class Basic03Helper {
    public static void InsertNewContacts(List<Contact> newcontacts){
        Set<Id> AccountIds = new Set<Id>();
        for(Contact con:newcontacts){
            if(con.AccountId!=null){
                 AccountIds.add(con.AccountId);
            }
        }

        Map<Id,Account> accountMap = new Map<Id,Account>(
            [Select id,BillingAddress from account where id in: AccountIds]
        );


        for(Contact con:newcontacts){
            if(con.AccountId!=null && accountMap.containsKey(con.AccountId)){
                con.MailingAddress = accountMap.get(con.AccountId);
            }
        }

    }

    public static void UpdateContacts(List<Contact> newcontacts,Map<id,Contact> oldMap){
        Set<Id> AccountIds = new Set<Id>();
        
        for(Contact con:newcontacts){
            if(con.AccountId!=null && con.AccountId!=oldMap.get(con.Id).AccountId){
                AccountIds.add(con.AccountId);
            }
        }

        Map<Id,Account> accountMap = new Map<Id,Account>([
            SELECT id,BillingAddress from Account where id in :AccountIds
        ]);

        for(Contact con:newContacts){
            if(con.AccountId!=null && con.AccountId!=oldMap.get(con.Id).AccountId && accountMap.containsKey(con.AccountId)){
                con.MailingAddress = accountMap.get(con.AccountId);
            }
        }
    }
}