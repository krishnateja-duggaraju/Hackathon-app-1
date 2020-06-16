public class LMS_CustomerController {
    @AuraEnabled
    public static boolean lms_Register_Customer(LMS_Customer__c user) {
        boolean val = false;
        
        try {
            insert user;
            val = true;
        } catch(Exception e) {
            val = false;
            System.debug(e);
        }
        
        return val;
    }
    
    @AuraEnabled
    public static LMS_Customer__c lms_Login_Customer(string username,string password) {
        
        LMS_Customer__c result = null;
        try {
             result = [SELECT LMS_Email__c, LMS_Password__c, LMS_First_Name__c, LMS_Last_Name__c 
                                            FROM  LMS_Customer__c 
                                            WHERE Name=:username 
                                                  and LMS_Password__c=:password 
                                            limit 1];
            
        } catch(Exception e) {
            
            System.debug(e.getMessage());
        }
        
        return result;
    }
    @AuraEnabled
    public static boolean lms_Customer_ForgotPwd(string email,string securityQuestion,string answer) {
        boolean val = false;
       
        try {
            List<LMS_Customer__c> result = [SELECT LMS_Email__c,LMS_CustomerSecurityQuestion__c, LMS_CustomerAnswer__c
                                            FROM  LMS_Customer__c
                                            WHERE LMS_Email__c=:email and LMS_CustomerSecurityQuestion__c=:securityQuestion
                                                  and LMS_CustomerAnswer__c=:answer
                                            limit 1];
            if(result.size() < 0) {
                System.debug('securityQuestion or answer incorrect');
                val = false;
            } else {
                System.debug('sucessful '+ result);
                val = true;
               System.debug(result[0]);
            }
        } catch(Exception e) {
            val=false;
            System.debug(e);
        }
       
        return val;
    }
    
    /*@AuraEnabled
    public static boolean lms_Customer_ResetPwd(string email,string newPassword) {
        boolean val = false;
       
        try {
     
        LMS_Customer__c result = [SELECT LMS_Email__c
                                            FROM  LMS_Customer__c
                                            WHERE LMS_Email__c=:email
                                            limit 1];
            
          
            
            if(result==null) {
           
                System.debug('There is no such email');
                val = false;
            } else {
                try{
                result.LMS_Password__c = newPassword; 
                update result;
                System.debug('sucessful '+ result);
                
                val = true;
               System.debug(result);
                }
                catch(Exception e){
                    val=false;
                }
            }
        } catch(Exception e) {
            val=false;
            System.debug(e);
        }
       
        return val;
    }*/
/*@AuraEnabled
    public static boolean storeNewPwdAndConfirmPwd(string email,string fetchSQ,string fetchAns,LMS_Customer__c customer,LMS_CustomerResetPassword__c newuser) {
         boolean val = false;
     try {
        
            List<LMS_Customer__c> result = [SELECT LMS_Email__c
                                            FROM  LMS_Customer__c
                                            WHERE LMS_Email__c=:email
                                            limit 1];
            if(result.size() < 0) {
                System.debug('Email address is incorrect');
                val = false;
            }
         else {
             insert newuser;
             //LMS_Owner__c[] owr = new List<LMS_Owner__c>();
             LMS_Customer__c pwd;
            
                 pwd=[SELECT LMS_Password__c, LMS_Email__c FROM LMS_Customer__c
                                                  WHERE LMS_Email__c = :newuser.LMS_CustomerNewEmail__c and
                                                     LMS_CustomerSecurityQuestion__c=:fetchSQ and
                                                     LMS_CustomerAnswer__c=:fetchAns limit 1];
             pwd.LMS_Password__c=newuser.LMS_CustomerNewPassword__c;
             update pwd;
             //List<LMS_OwnerResetPassword__c> r = [SELECT LMS_OwnerNewPassword__c
                                            //FROM  LMS_OwnerResetPassword__c
                                            //WHERE LMS_OwnerNewEmail__c=:email
                                            //limit 1];
             //if(r.size()>0){
                
             //owner.LMS_OwnerPassword__c=newowner.LMS_OwnerNewPassword__c;
             //owner.LMS_OwnerPassword__c=newowner.LMS_OwnerNewPassword__c;
              //  upsert owner;
             //insert newOwner;
               // System.debug('sucessful '+ result);
                 val = true;
              
               
                 //System.debug(result[0]);
                 //}
             //else{val=false;}
            }
        } catch(Exception e) {
            val=false;
            System.debug(e);
        }
       
        return val;
    }*/
    
    
    @AuraEnabled
    public static LMS_Customer__c lms_GetCustomer(String email) {
        
        //LMS_Customer__c cust = null;
        try {
            LMS_Customer__c cust = [SELECT Id, LMS_CustomerSecurityQuestion__c, LMS_CustomerAnswer__c, LMS_Password__c
                      FROM LMS_Customer__c
                      WHERE LMS_Email__c =: email limit 1];
            return cust;
            
        } catch(Exception e) {
            system.debug(e.getMessage());
            return null;
        } 
        
    }
    
    
     @AuraEnabled
    public static boolean lms_ResetPassword(LMS_Customer__c cust, String pwd) {
        boolean val = false;
        cust.LMS_Password__c = pwd;
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
    @AuraEnabled
	public static List < LMS_Agent__c > fetchAgent(String agentId) {
 		List < LMS_Agent__c > returnList = new List < LMS_Agent__c > ();
  		List < LMS_Agent__c > lstOfAgent= [select LMS_AgentFirstName__c,LMS_AgentLastName__c,LMS_AgentEmail__c,LMS_AgentPhone__c from LMS_Agent__c
                                Where Id =:agentId];
        
      
        system.debug(agentId);

  		for (LMS_Agent__c agent: lstOfAgent) {
   			returnList.add(agent);
  		}
 		return returnList;
	}
     
    @AuraEnabled
	public static List < LMS_RecentlyViewed  > fetchRecentHistory(String customerId) {
 		List < LMS_RecentlyViewed > returnList = new List < LMS_RecentlyViewed > ();
  		List < Opportunity > lstOfHistoryDetails= [select Name ,LMS_Owner__c,LMS_Agent__c,LMS_Property__c, StageName from Opportunity
                                Where  LMS_Customer__c =:customerId ORDER BY LastModifiedDate desc];
        
      
        system.debug(customerId);

  		for (Opportunity opp: lstOfHistoryDetails) {
   			List<String> names = getNames(opp.LMS_Owner__c,opp.LMS_Agent__c,opp.LMS_Property__c);
            LMS_RecentlyViewed obj = new LMS_RecentlyViewed();
            obj.stage = opp.StageName;
            obj.oppName = opp.Name;
            obj.OwnerName = names[0];
            obj.AgentName = names[1];
            obj.PropertyName = names[2];
            returnList.add(obj);
            
  		}
 		return returnList;
	}
    
     public static List<String> getNames(String ownerId, String agentId, String propertyId){
        
        List<String> returnList = new List<String>();
        
        LMS_Owner__c  owner = [select Name from LMS_Owner__c
                                Where  Id =:ownerId];
         
         LMS_Agent__c  agent = [select Name from LMS_Agent__c
                                Where  Id =:agentId];
         LMS_Property__c  property = [select Name from LMS_Property__c
                     Where  Id =:propertyId];
         
         
         returnList.add(owner.Name);
         returnList.add(agent.Name);
         returnList.add(property.Name);
	
        return returnList;

        
    }
    
    
}