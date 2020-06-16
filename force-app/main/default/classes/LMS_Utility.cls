public class LMS_Utility {

    @AuraEnabled
    public static String getCustomerEmail(String customerId) {
        String email = null;
        LMS_Customer__c customer;
        try {
            customer = [SELECT LMS_Email__c FROM LMS_Customer__c WHERE Id =:customerId ];
    		email = customer.LMS_Email__c;
            return email;
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        }
        
    }
    
    @AuraEnabled
    public static String getOwnerEmail(String ownerId) {
        String email = null;
        LMS_Owner__c owner;
        try {
            owner = [SELECT LMS_OwnerEmail__c FROM LMS_Owner__c WHERE Id =:ownerId ];
    		email = owner.LMS_OwnerEmail__c;
            return email;
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        }
        
    }
    
    @AuraEnabled
    public static String getAgentEmail(String agentId) {
        String email = null;
        LMS_Agent__c agent;
        try {
            agent = [SELECT LMS_AgentEmail__c FROM LMS_Agent__c WHERE Id =:agentId ];
    		email = agent.LMS_AgentEmail__c;
            return email;
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        }
        
    }
    
    @AuraEnabled
    public static String ownerEmailFromPropertyName(String PropertyName) {
        String email = null;
        LMS_Property__c property;
        try {
            property = [SELECT LMS_Owner__c FROM LMS_Property__c WHERE Name =:PropertyName ];
    		email = getOwnerEmail(property.LMS_Owner__c);
            return email;
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        }
    }
    
    
    @AuraEnabled
    public static String agentEmailFromPropertyName(String PropertyName) {
        String email = null;
        LMS_Property__c property;
        try {
            property = [SELECT LMS_Agent__c FROM LMS_Property__c WHERE Name =:PropertyName ];
    		email = getAgentEmail(property.LMS_Agent__c);
            return email;
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        }
    }
    
    @AuraEnabled
    public static String propertyIdFromPropertyName(String PropertyName) {
        String identity = null;
        LMS_Property__c property;
        try {
            property = [SELECT Id FROM LMS_Property__c WHERE Name =:PropertyName ];
    		identity = property.Id;
            return identity;
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        }
    }
    
}