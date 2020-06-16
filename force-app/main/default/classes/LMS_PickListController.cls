public class LMS_PickListController {
	@AuraEnabled        
    public static List<String> getPickListValuesIntoList(String objectType, String selectedField){
        List<String> pickListValuesList = new List<String>();
        Schema.SObjectType convertToObj = Schema.getGlobalDescribe().get(objectType);
        Schema.DescribeSObjectResult res = convertToObj.getDescribe();
        Schema.DescribeFieldResult fieldResult = res.fields.getMap().get(selectedField).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }     
        return pickListValuesList;
    }
    
    
    
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
    
    
    @AuraEnabled
    public static List <String> getPiklistValues() {
        List<String> plValues = new List<String>();
         
        //Get the object type from object name. Here I've used custom object Book.
        Schema.SObjectType objType = Schema.getGlobalDescribe().get('LMS_Property__c');
         
        //Describe the sObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
         
        //Get the specific field information from field name. Here I've used custom field Genre__c of Book object.
        Schema.DescribeFieldResult objFieldInfo = objDescribe.fields.getMap().get('LMS_Aminities__c').getDescribe();
         
        //Get the picklist field values.
        List<Schema.PicklistEntry> picklistvalues = objFieldInfo.getPicklistValues();
         
        //Add the picklist values to list.
        for(Schema.PicklistEntry plv: picklistvalues) {
            plValues.add(plv.getValue());
        }
        plValues.sort();
        return plValues;
    }
    
    @AuraEnabled        
    public static LMS_Agent__c getAgentDetails(String propId, String custId) {
        LMS_Property__c property = [select Id,Name, LMS_Agent__c, LMS_Property_Sale_Value__c, LMS_Owner__c from LMS_Property__c WHERE Id = :propId limit 1];
        system.debug('property Id' +propId);         
        String ownerId = property.LMS_Owner__c;
        system.debug('owner Id' +ownerId);
        String agentId = property.LMS_Agent__c;
        system.debug('Agent Id' +agentId);
        String customerEmail = LMS_Utility.getCustomerEmail(custId);
        String ownerEmail = LMS_Utility.getOwnerEmail(ownerId);
        String agentEmail = LMS_Utility.getAgentEmail(agentId);
        
        Opportunity op = new Opportunity();
        op.LMS_Customer__c = custId;
        op.LMS_Property__c = propId;
        op.LMS_Owner__c = ownerId;
        op.LMS_Agent__c = agentId;
        op.StageName = 'LMS_Prospecting';
        op.Name = 'OP -'+property.Name;
        op.CloseDate = Date.today() + 30;
        op.LMS_Customer_Email__c = customerEmail;
        op.LMS_Owner_Email__c = ownerEmail;
        op.LMS_Agent_Email__c = agentEmail;
        op.Amount = property.LMS_Property_Sale_Value__c;
        try {
            insert op;
            System.debug('opportunity created');
        } catch(Exception e) {
            System.debug(e.getMessage());
        } finally {
            return [select Id, Name from LMS_Agent__c where Id = :agentId limit 1];
        }
     return [select Id, Name from LMS_Agent__c where Id = :agentId limit 1];
        
        
    }
    
    
    
}