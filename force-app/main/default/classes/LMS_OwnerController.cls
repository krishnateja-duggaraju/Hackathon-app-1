public class LMS_OwnerController {
@AuraEnabled
    public static boolean lms_Login_Owner(string email,string password) {
        boolean val = false;
        
        try {
            List<LMS_Owner__c> result = [SELECT LMS_OwnerEmail__c, LMS_OwnerPassword__c
                                            FROM  LMS_Owner__c
                                            WHERE LMS_OwnerEmail__c=:email 
                                                  and LMS_OwnerPassword__c=:password 
                                            limit 1];
            if(result.size() < 0) {
                System.debug('email or password incorrect');
                val = false;
            } else {
                System.debug('login sucessful '+ result);
                val = true;
               System.debug(result[0]);
            }
        } catch(Exception e) {
            val=false;
            System.debug(e);
        }
        
        return val;
    }
    
  /* @AuraEnabled
	public static List < LMS_Customer__c > fetchCustomer(string city) {
 		List < LMS_Customer__c > returnList = new List < LMS_Customer__c > ();
 		List < LMS_Customer__c > lstOfCustomers = [select LMS_Last_Name__c, LMS_CustomerCity__c from LMS_Customer__c where LMS_CustomerCity__c=:city limit 30];      

  		for (LMS_Customer__c cust: lstOfCustomers) {
   			returnList.add(cust);
  		}
		return returnList;
	}*/
    
}