@isTest
private class Basic03Test {

    @isTest
    static void myUnitTest() {
        List<Account> accountList = new List<Account>();
        for(Integer i=1;i<=50;i++){
            accountList.add(new Account(Name='Test Account +'+i,BillingAddress='Test Address'+i));
        }

        insert accountList;


        List<Contact> contactList = new List<Contact>();

        for(Integer i=1;i<=50;i++){
            contactList.add(new Contact(FirstName='Test Contact'+i,LastName='',AccountId=accountList[i-1].id));
        }

        insert contactList;

        Set<Id> contactIds = new Set<Id>();

        for(Contact c:contactList){
            contactIds.add(c.Id);
        }

        Map<Id,Contact> contactMap = new Map<Id,Contact>([select id,MailingAddress,AccountId from contact where id in:contactIds]);
        
        Set<Id> accountIds = new Set<Id>();
        for(Id conId:contactMap.keySet()){
            accountIds.add(contactMap.get(conId).AccountId);
        }

        Map<Id,Account> accountMap = new Map<Id,Account>([select id,BillingAddress from Account where id in :accountIds]);

        Integer count=0;
        for(Id conId:contactMap.keySet()){
            Account tempAccount = accountMap.get(contactMap.get(conId).AccountId);
            if(contactMap.get(conId).MailingAddress==tempAccount.BillingAddress){
                count++;
            }
        }

        System.assertEquals(50, count,'It is not working');
    }
}