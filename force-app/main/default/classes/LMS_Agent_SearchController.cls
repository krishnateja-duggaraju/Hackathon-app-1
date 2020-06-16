public class LMS_Agent_SearchController {
@AuraEnabled
	public static List < LMS_Agent__c > fetchAgent() {
 		List < LMS_Agent__c > returnList = new List < LMS_Agent__c > ();
  		List < LMS_Agent__c > lstOfAgent = [select  LMS_AgentLastName__c,LMS_AgentEmail__c, LMS_AgentPhone__c from LMS_Agent__c
                                LIMIT 25];

  		for (LMS_Agent__c agent: lstOfAgent) {
   			returnList.add(agent);
  		}
 		return returnList;
	}
    @AuraEnabled
	public static List < LMS_Owner__c > fetchOwner() {
 		List < LMS_Owner__c > returnList = new List < LMS_Owner__c > ();
 		List < LMS_Owner__c > lstOfOwner = [select 	 LMS_OwnerLastName__c, LMS_OwnerEmail__c , LMS_OwnerPhone__c	 from LMS_Owner__c
                                LIMIT 25];

  		for (LMS_Owner__c owner: lstOfOwner) {
   			returnList.add(owner);
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
}