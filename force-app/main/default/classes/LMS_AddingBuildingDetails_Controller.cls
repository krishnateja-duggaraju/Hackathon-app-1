public class LMS_AddingBuildingDetails_Controller {
   

    @AuraEnabled
    public static List<LMS_Property__c> fetchAcc (){
        return [SELECT Name, LMS_Property_Type__c,LMS_Property_Details__c,LMS_Property_Sale_Value__c,
                LMS_Property_Rental_Value_Month__c,LMS_Total_Area__c,LMS_City__c,
                LMS_Locality__c,LMS_Facing_of_Apartment__c,LMS_Gated_Community__c,
                LMS_Furnished__c,LMS_Address__c,LMS_Aminities__c,LMS_State__c,
                Country__c FROM LMS_Property__c ORDER BY CreatedDate desc];
    }

	@AuraEnabled
    public static void saveDetails (LMS_Property__c regForm1){ 
    	insert regForm1;
    }
     @AuraEnabled
    public static boolean createProperty(String ownerId, LMS_Property__c property) {
        boolean value = false;
        
        property.LMS_Owner__c = OwnerId;
        
        LMS_Agent__c agent = [SELECT Id FROM LMS_Agent__c WHERE LMS_Agent_Locality__c =:property.LMS_Locality__c limit 1];
        
        property.LMS_Agent__c = agent.Id;
        
        Database.SaveResult result = Database.insert(property);
        if(result.isSuccess() == true) {
            value = true;
        } else {
            System.debug(result.getErrors());
            value = false;
        }
        
        
        return value;
    }
    

}