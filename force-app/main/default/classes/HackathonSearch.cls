public class HackathonSearch {
    @AuraEnabled
public static List < ApexClass > fetchMatch() {
        List<ApexClass> returnList = new List<ApexClass>();   
       List<ApexClass> failedList = new List<ApexClass>();   
         List < ApexClass > apclass2 = [SELECT Name FROM ApexClass where Name like '%Test'];
         List<ApexClass> apclass1 = [SELECT Name FROM ApexClass where not Name like '%Test'];
 for (ApexClass apex2: apclass2) {
   for (ApexClass apex1: apclass1) {

       
       
       //System.debug(apex1);
      // System.debug('hi');
       //System.debug(apex2);
     
     if(apex2.Name==apex1.Name + 'Test'){
         
         System.debug(' Success');
         

   			returnList.add(apex2);
             
          }
        else
          {
               System.debug(' Fail');
   			
            

          }
    
   }
 }
    return returnList;   
}
    
}