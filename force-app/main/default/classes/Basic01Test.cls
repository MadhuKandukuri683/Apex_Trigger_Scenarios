
@isTest
public  class Basic01Test {
    @isTest static void CheckBasic(){
        // Create 50 Accounts with Banking Industry
        List<Account> acc = new List<Account>();
        for(Integer i=1;i<=50;i++){
            acc.add(new Account(Name='Banking Account '+i,Industry='Banking'));
        }

        // Create 50 Accounts with Banking Industry
        for(Integer i=1;i<=50;i++){
            acc.add(new Account(Name='Other Account '+i,Industry='Other'));
        }

        Insert acc;

        List<Contact> cons = new List<Contact>();
        for(Account a:acc){
            cons.add(new Contact(FirstName='Contact '+a.Name,LastName='Test',AccountId=a.id));
        }

        Insert cons;
        Set<id> ContactIds = new Set<Id>();
        for(Contact c : cons){
            ContactIds.add(c.Id);
        }
        List<Contact> insertedContacts = [select id,Description,account.Industry from Contact where id in:ContactIds];
        Integer count = 0;
        for(Contact cn:insertedContacts){
            if(cn.Description=='Banking Client'){
                count++;
            }
        }

        System.assertEquals(50, count,'It is not working');

    }
}