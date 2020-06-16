public class LMS_Agent_Forgotpwdcontroller {
     @AuraEnabled
    public static LMS_Agent__c lms_GetCustomer(String email) {
        LMS_Agent__c agent = null;
        try {
            agent =  [SELECT Id, LMS_AgentSecurityQuestion__c, LMS_AgentAnswer__c, LMS_AgentPassword__c,LMS_AgentConfirmPassword__c 
                                FROM LMS_Agent__c
                      			WHERE LMS_AgentEmail__c =: email limit 1];
            return agent;
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        return agent;
        
        
    }
    
    
     @AuraEnabled
    public static boolean lms_ResetPassword(LMS_Agent__c cust, String pwd) {
        boolean val = false;
        cust.LMS_AgentPassword__c = pwd;
        cust.LMS_AgentConfirmPassword__c=pwd;
        try {
          update cust;
          val = true;
        } catch(Exception e) {
            val = false;
            system.debug(e.getLineNumber());
            system.debug(e.getMessage());
            
        }
               
        return val;
    }
    
    

}