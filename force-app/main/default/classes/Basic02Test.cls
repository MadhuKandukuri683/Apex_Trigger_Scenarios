
@isTest
private class Basic02Test {

    @isTest
    static void myUnitTest() {
        List<Account> Acc = new List<Account>();
        for(Integer i = 1; i<=50;i++){
            Acc.add(new Account(Name='Test Account '+i));
        }

        insert Acc;

        List<Account> DupAcc = new List<Account>();
        for(Integer i = 1; i<=50;i++){
            DupAcc.add(new Account(Name='Test Account '+i));
        }


        Database.SaveResult[] results = Database.insert(DupAcc,false);

        Integer failedCount = 0;
        for(Database.SaveResult ds:results){
            if(!ds.isSuccess()){
                failedCount++;
            }
        }
        
        System.assertEquals(50, failedCount,'Code is not working');
        
    }
}