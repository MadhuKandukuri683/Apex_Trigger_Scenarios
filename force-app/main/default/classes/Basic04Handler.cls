public with sharing class Basic04Handler {
  public static void UpdateAccounts(
    List<Contact> newcontacts,
    Map<Id, Contact> oldMap
  ) {
    Set<Id> AccountIds = new Set<Id>();

    for (Contact ct : newcontacts) {
      if (oldMap.containsKey(ct.Id)) {
        if (ct.Email != null && ct.Email != oldMap.get(ct.Id).Email) {
          AccountIds.add(ct.AccountId);
        }
      } else {
        if (ct.Email != null) {
          AccountIds.add(ct.AccountId);
        }
      }
    }

    List<Account> accountList = [
      SELECT id, Last_Contact_Change__c
      FROM Account
      WHERE id IN :AccountIds
    ];

    for (Account acc : accountList) {
      acc.Last_Contact_Change__c = System.Date.today();
    }

    update accountList;
  }
}
