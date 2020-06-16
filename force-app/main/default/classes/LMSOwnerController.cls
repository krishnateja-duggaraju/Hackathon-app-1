public class LMSOwnerController {
@AuraEnabled
    public static LMS_Owner__c lms_Login_Owner(string email,string password) {
        
        

            LMS_Owner__c result = [SELECT Id, LMS_OwnerEmail__c, LMS_OwnerPassword__c
                                            FROM  LMS_Owner__c
                                            WHERE LMS_OwnerEmail__c=:email 
                                            	  and LMS_OwnerPassword__c=:password 
                                            limit 1];
            if(result == null ) {
                System.debug('email or password incorrect');
                
            } else {
               if(result.LMS_OwnerPassword__c==password  ){
                result.Activated__c='yes';
                update result;
               
                System.debug('login sucessful '+ result);
                   System.debug(result);                 }
            }
        
        
        return result;
    }
    
}