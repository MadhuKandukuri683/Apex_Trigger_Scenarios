// 3. Auto-Copy Billing Address
// Scenario: When a Contact is created and linked to an Account, copy the Account's Billing Address to the Contact's Mailing Address.
trigger Basic03 on Contact (before insert,before Update) {
    if(Trigger.isBefore && Trigger.isInsert){
        Basic03Handler.BeforeInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        Basic03Handler.BeforeUpdate(Trigger.new,Trigger.oldMap);
    }
}