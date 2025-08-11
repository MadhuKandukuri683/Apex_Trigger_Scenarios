// 1. Contact–Account Industry Check
// Scenario: When a new Contact is inserted, if the related Account's Industry is "Banking", set the Contact’s Description field to “Banking Client”.
trigger Basic01 on Contact (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            Basic01Handler.beforeInsert(Trigger.new);
        }
    }
}