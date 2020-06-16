public class LMS_Owner_ForgotPasswordcontroller {
     @AuraEnabled
    public static LMS_Owner__c lms_GetOwner(String email) {
            
         LMS_Owner__c owner = null;
        try {
            owner =  [SELECT Id, LMS_OwnerSecurityQuestion__c, LMS_OwnerAnswer__c, LMS_OwnerPassword__c,LMS_OwnerConfirmPassword__c 
                                FROM LMS_Owner__c
                      			WHERE LMS_OwnerEmail__c =: email limit 1];
            return owner;
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        return owner;
    }
    
     @AuraEnabled
    public static boolean lms_ResetPassword(LMS_Owner__c owner, String pwd) {
        boolean val = false;
        owner.LMS_OwnerPassword__c = pwd;
        owner.LMS_OwnerConfirmPassword__c=pwd;
        try {
          update owner;
          val = true;
        } catch(Exception e) {
            val = false;
            system.debug(e.getLineNumber());
            system.debug(e.getMessage());
            
        }
               
        return val;
    }
    
}