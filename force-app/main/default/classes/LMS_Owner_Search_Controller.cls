public class LMS_Owner_Search_Controller {
    
    @AuraEnabled
    public static list<LMS_Customer__c> lms_GetCustomers(String locality) {
        
        system.debug([select LMS_First_Name__c, LMS_CustomerCity__c from LMS_Customer__c where LMS_CustomerCity__c=:locality limit 10]);
        return [select LMS_First_Name__c, LMS_CustomerCity__c, LMS_CustomerState__c, LMS_Customer_Company__c,
                LMS_CustomerLocality__c from LMS_Customer__c where LMS_CustomerLocality__c=:locality limit 30];        
    }
    
     @AuraEnabled
    public static List<LMS_Property__c> fetchProperty (){
        return [SELECT LMS_Property_Type__c,LMS_Property_Details__c,LMS_Property_Sale_Value__c,
                LMS_Property_Rental_Value_Month__c,LMS_Total_Area__c,LMS_City__c,
                LMS_Locality__c,LMS_Facing_of_Apartment__c,LMS_Gated_Community__c,
                LMS_Furnished__c,LMS_Address__c,LMS_Aminities__c,LMS_State__c,
                Country__c,LMS_PropertyId__c,LMS_Property_Status__c,Agent_Name__c,Agent_Phone__c FROM LMS_Property__c ORDER BY CreatedDate desc];
    }

	
     @AuraEnabled
    public static boolean createProperty(String ownerId, LMS_Property__c property) {
        boolean value = false;
        LMS_Agent__c agent = null;
        Opportunity[] opp;
        LMS_Property__c[] pro;
        LMS_Property__c[] pro2;
        property.LMS_Owner__c = OwnerId;
        try {
             agent = [SELECT Id, LMS_AgentFirstName__c,	LMS_AgentPhone__c FROM LMS_Agent__c WHERE LMS_Agent_Locality__c =:property.LMS_Locality__c limit 1];
            /*opp= [SELECT Id, LMS_Property__c,Name,StageName FROM Opportunity WHERE StageName='Closed Won' and LMS_Property__c!=null];
            for(Opportunity o:opp)
            {
            if(o!=null){
            pro=[SELECT Id FROM LMS_Property__c WHERE Id=:o.LMS_Property__c ];
            for(LMS_Property__c p:pro){
                p.Opportunity__c=o.Id;
                p.LMS_PropertyId__c=o.Name;
                p.LMS_Property_Status__c='Sold Out';
               upsert pro;
                }
                //upsert pro;
}}*/
                pro2=[SELECT Id FROM LMS_Property__c WHERE Id NOT IN (SELECT LMS_Property__c FROM Opportunity WHERE StageName='Closed Won' and LMS_Property__c!=null ) limit 30];
                for(LMS_Property__c p:pro2){
                    p.Opportunity__c=null;
                p.LMS_PropertyId__c=null;
                p.LMS_Property_Status__c='Available';
				upsert pro2;                
            }
            
        } catch(Exception e) {
            System.debug(e.getMessage());
        } finally {
            if(agent!=null) {
        		property.LMS_Agent__c = agent.Id;
        		property.Agent_Name__c=agent.LMS_AgentFirstName__c;
        		property.Agent_Phone__c=agent.LMS_AgentPhone__c;
                property.Opportunity__c=null;
                property.LMS_PropertyId__c=null;
                property.LMS_Property_Status__c='Available';
        	} else {
            	property.LMS_Agent__c = null;
            	property.Agent_Name__c=null;
        		property.Agent_Phone__c=null;
                property.Opportunity__c=null;
                property.LMS_PropertyId__c=null;
                property.LMS_Property_Status__c='Available';
        	}
            
            /*if(opp!=null && pro!=null){
                for(LMS_Property__c p:pro){
                p.Opportunity__c=opp.Id;
                p.LMS_PropertyId__c=opp.Name;
                p.LMS_Property_Status__c='Sold Out';
                upsert pro;
                }
            }
            else{
                for(LMS_Property__c p:pro){
                p.LMS_PropertyId__c=null;
                p.LMS_Property_Status__c='Available';
                upsert pro;
                }
                property.Opportunity__c=opp.Id;
                property.LMS_PropertyId__c=null;
                property.LMS_Property_Status__c='Available';
            }*/
        
        	Database.SaveResult result = Database.insert(property);
        	if(result.isSuccess() == true) {
            	value = true;
        	} else {
            System.debug(result.getErrors());
            value = false;
        	}
        }
        return value;
    }
    @AuraEnabled
	public static List < LMS_RecentlyViewed  > fetchRecentHistory(String ownerId) {
 		List < LMS_RecentlyViewed > returnList = new List < LMS_RecentlyViewed > ();
  		List < Opportunity > lstOfHistoryDetails= [select Name ,LMS_Customer__c,LMS_Agent__c,LMS_Property__c, StageName from Opportunity
                                Where  LMS_Owner__c =:ownerId];
        
      
        system.debug(ownerId);

  		for (Opportunity opp: lstOfHistoryDetails) {
   			List<String> names = getNames(opp.LMS_Customer__c,opp.LMS_Agent__c,opp.LMS_Property__c);
            LMS_RecentlyViewed obj = new LMS_RecentlyViewed();
            obj.customerName = getCustomerName(opp.LMS_Customer__c);
            obj.agentName = getAgentName(opp.LMS_Agent__c);
            obj.stage = opp.StageName;
            obj.oppName = opp.Name;
            obj.OwnerName = names[0];
            obj.AgentName = names[1];
            obj.PropertyName = names[2];
            returnList.add(obj);
            
  		}
 		return returnList;
	}
    
     public static List<String> getNames(String customerId, String agentId, String propertyId){
        
        List<String> returnList = new List<String>();
        
        LMS_Customer__c  customer = [select Name from LMS_Customer__c
                                Where  Id =:customerId];
         
         LMS_Agent__c  agent = [select Name from LMS_Agent__c
                                Where  Id =:agentId];
         LMS_Property__c  property = [select Name from LMS_Property__c
                     Where  Id =:propertyId];
         
         
         returnList.add(customer.Name);
         returnList.add(agent.Name);
         returnList.add(property.Name);
	
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
    public static String getAgentName(String aId) {
        String n = null;
        try {
        	LMS_Agent__c agent = [select LMS_AgentFirstName__c, LMS_AgentLastName__c from  LMS_Agent__c where Id =:aId];
        	n = agent.LMS_AgentFirstName__c+' '+agent.LMS_AgentLastName__c; 
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        return n;
    }
    @AuraEnabled
    public static Note fetchNotes (){
        
   return [ SELECT Body,Id,OwnerId,ParentId,Title FROM Note];
    }


}