trigger UpdatePropertyStatus on Opportunity (before update,after update) {
    set<id> propertyIds = new set<id>();
for(Opportunity opp : trigger.new){
    if(opp.stageName == 'Closed Won'  && !String.isBlank(opp.LMS_Property__c)){
        propertyIds.add(opp.LMS_Property__c);
    }
}
    if(propertyIds != null && !propertyIds.isEmpty()){
Map<id,LMS_Property__c> proMap = new Map<id,LMS_Property__c>([SELECT Id FROM LMS_Property__c WHERE Id in : propertyIds]);
for(Opportunity opp : trigger.new){
    if(opp.stageName == 'Closed Won' && !String.isBlank(opp.LMS_Property__c) ) {
        proMap.get(opp.LMS_Property__c).LMS_Property_Status__c =  'Sold Out';
       	proMap.get(opp.LMS_Property__c).LMS_PropertyId__c =  opp.Name; 
    }
}
       
 if(proMap != null && !proMap.isEmpty())
update proMap.values();
}
 if(propertyIds == null && propertyIds.isEmpty()){
Map<id,LMS_Property__c> proMap2 = new Map<id,LMS_Property__c>([SELECT Id FROM LMS_Property__c WHERE Id not in
                                                                : propertyIds]);
for(Opportunity opp : trigger.new){
    if(opp.stageName != 'Closed Won' && String.isBlank(opp.LMS_Property__c) ) {
        proMap2.get(opp.LMS_Property__c).LMS_Property_Status__c =  'Available';
       	proMap2.get(opp.LMS_Property__c).LMS_PropertyId__c =  null; 
    }
}
     if(proMap2 != null && !proMap2.isEmpty())
update proMap2.values();
}
}