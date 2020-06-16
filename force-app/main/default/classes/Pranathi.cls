public class Pranathi {
	@AuraEnabled
    public static List<LMS_Property__c> getDetails(String state, String country, String city, String detail,boolean furnished, boolean gated_community, List<String> selectedaminitiesList) {
         List<LMS_Property__c> result = [SELECT Id, Name, LMS_Address__c, Country__c, LMS_City__c, LMS_State__c, LMS_Total_Area__c, LMS_Property_Rental_Value_Month__c, LMS_Property_Sale_Value__c
                FROM LMS_Property__c
                wHERE LMS_State__c=: state
               			and Country__c=:country
               			and (LMS_City__c=:city
               			or LMS_Property_Details__c>=:detail
               			or LMS_Furnished__c =:furnished
               			or LMS_Gated_Community__c=:gated_community
               			or LMS_Aminities__c=:selectedaminitiesList)];

        
        system.debug(result);
	if(result.size()>0) {
            return result;
        } else {
            return null;
        }

        
        
    }
    
    }