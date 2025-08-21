//4. Update Account When Contact is Updated
//Scenario: When a Contact’s Email is changed, update the related Account’s Last_Contact_Change__c (custom field) with today’s date.
trigger Basic04 on Contact(after insert, after update) {
  if (Trigger.isAfter) {
    Basic04Handler.UpdateAccounts(Trigger.new, Trigger.oldMap);
  }

}
