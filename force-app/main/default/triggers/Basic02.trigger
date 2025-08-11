//Prevent Duplicate Account Names
//Scenario: Prevent users from inserting an Account with a name that already exists (case-insensitive).
trigger Basic02 on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert)
    {
        Basic02Handler.beforeInsert(Trigger.new);
    }
}