public with sharing class Basic03Handler {
    public static void BeforeInsert(List<Contact> newContacts){
        Basic03Helper.InsertNewContacts(newContacts);
    }

    public static void BeforeUpdate(List<Contact> newContacts,Map<Id,Contact> oldMap){
        Basic03Helper.UpdateContacts(newContacts,oldMap);
    }
}