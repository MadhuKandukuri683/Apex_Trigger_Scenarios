public with sharing class Basic01Handler {
    public static void beforeInsert(List<Contact> newContacts){
        Basic01Helper.InsertNewContacts(newContacts);
    }
}