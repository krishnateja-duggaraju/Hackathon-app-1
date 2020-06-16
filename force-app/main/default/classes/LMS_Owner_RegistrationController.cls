public class LMS_Owner_RegistrationController {
    @AuraEnabled
    public static boolean registerAsOwner(LMS_Owner__c owner) {
        boolean val = false;
        try {
            insert owner;
            val = true;
        } catch(Exception e) {
            val = false;
            System.debug(e);
        }
       
        return val;
    }

}