public class LMS_AgentController {
@AuraEnabled
    public static String lms_Agent_addDetails(LMS_Agent__c agentDetails)
    {
        List<LMS_Agent__c> agent=new List<LMS_Agent__c>([Select LMS_AgentEmail__c From LMS_Agent__c]);
        try{
            System.debug(agentDetails);
                insert agentDetails;
            return 'Registered Successfully';
        }
        catch(Exception e)
        {
            System.debug('Details are not provided'+e.getMessage());
            for (Integer i=0; i<agent.size();i++){
            if(agentDetails.LMS_AgentEmail__c==agent[i].LMS_AgentEmail__c)
                return 'Email id already exists';
            }
            if(agentDetails.LMS_AgentPassword__c!=agentDetails.LMS_AgentConfirmPassword__c)
                return 'Password and confirm password must be equal';
            return '';
        }
    }
    @AuraEnabled
    public static String lms_Agent_loginDetails(String userName,String password){
        List<LMS_Agent__c> agent=new List<LMS_Agent__c>([Select LMS_AgentEmail__c,LMS_AgentPassword__c From LMS_Agent__c where LMS_AgentEmail__c=:userName  Limit 1]);
        if(agent.size()==0){
            return 'User does not exists!';
        }
        else{
            if(agent[0].LMS_AgentPassword__c==password ){
                 agent[0].LMS_AgentActivated__c=true;
                update agent;
                return 'Login Successfully';
            }
            else{
                return 'Invalid Password';
            }  
        }
    }
@AuraEnabled
	public static List < LMS_RecentlyViewed > fetchProspecting() {
 		List < LMS_RecentlyViewed > returnList = new List < LMS_RecentlyViewed > ();
  		List < Opportunity > lstOfHistoryDetails= [select Name ,LMS_Owner__c,LMS_Agent__c,LMS_Property__c, LMS_Customer__c, StageName from Opportunity
                                Where  StageName = 'LMS_Prospecting'];
        
      
       

  		for (Opportunity opp: lstOfHistoryDetails) {
   			List<String> names = LMS_CustomerController.getNames(opp.LMS_Owner__c,opp.LMS_Agent__c,opp.LMS_Property__c);
            LMS_RecentlyViewed obj = new LMS_RecentlyViewed();
            obj.customerName = getCustomerName(opp.LMS_Customer__c);
            obj.stage = opp.StageName;
            obj.oppName = opp.Name;
            obj.OwnerName = names[0];
            obj.AgentName = names[1];
            obj.PropertyName = names[2];
            returnList.add(obj);
            
  		}
 		return returnList;
	}
    @AuraEnabled
	public static List < LMS_Customer__c > fetchCustomer() {
 		List < LMS_Customer__c > returnList = new List < LMS_Customer__c > ();
  		List < LMS_Customer__c > lstOfCustomer= [select LMS_Last_Name__c, LMS_Email__c, LMS_Phone__c from LMS_Customer__c
                                LIMIT 25];

  		for (LMS_Customer__c customer: lstOfCustomer) {
   			returnList.add(customer);
  		}
 		return returnList;
	}
    
    public static String getCustomerName(String custId) {
        String name = null;
        try {
        	LMS_Customer__c customer = [select LMS_First_Name__c, LMS_Last_Name__c from  LMS_Customer__c where Id =:custId];
        	name = customer.LMS_First_Name__c+' '+customer.LMS_Last_Name__c; 
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        return name;
        
        
    }
    }