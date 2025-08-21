public with sharing class Basic04Test {
  @isTest
  static void CheckBasic() {
    Account acc = new Account(Name = 'Test Account');

    insert acc;

    Contact con = new Contact(
      FirstName = 'Test',
      LastName = 'Contact',
      Email = 'test@mail.com',
      AccountId = acc.id
    );

    insert con;

    System.assertEquals(System.Date.today(), acc.Last_Contact_Change__c);
  }
}
