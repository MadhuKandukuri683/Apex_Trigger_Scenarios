public with sharing class Basic02Handler {
    public static void beforeInsert(List<Account> newAccounts){
        Set<String> AccountNames = new Set<String>();

        for(Account acc:newAccounts){
            if(acc.Name!=null){
            AccountNames.add(acc.Name.toLowerCase());
            }
        }

        Map<String,Id> existingAccountNames = new Map<String,Id>();

        for(Account acc:[select Id,Name from Account where Name in :AccountNames]){
            if(acc.Name!=null && !existingAccountNames.containsKey(acc.Name.toLowerCase())){
                existingAccountNames.put(acc.Name.toLowerCase(),acc.Id);
            }
        }

        for(Account acc:newAccounts){
            if(acc!=null && existingAccountNames.containsKey(acc.Name.toLowerCase())){
                acc.addError('Account Name: '+acc.Name+' --> Already Exists');
            }
        }
    }
}