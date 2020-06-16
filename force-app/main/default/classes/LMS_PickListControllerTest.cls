@isTest public class LMS_PickListControllerTest {
@isTest static void getDetailsTest()
    {
     List<String> selectedaminitiesList = new List<String> {'Car parking','Lift facilities','Pet friendly'};
     Test.startTest();
        LMS_PickListController.getDetails('Andhra Pradesh','India','Vizag','3BHK',true,true,selectedaminitiesList);
        System.assertEquals('List has no rows','List has no rows');
        LMS_PickListController.getDetails('Andhra Pradesh','Australia','Hyderabad','3BHK',true,false,selectedaminitiesList);
        System.assertEquals('No details found','No details found'); 
        Test.stopTest();
    }
   @isTest static void getAgentDetailsTest()
    {
    
     Test.startTest();
        LMS_PickListController.getAgentDetails('LMSProperty-000013','LMSCustomer-00024');
        System.assertEquals('Retrived','Retrived');
        LMS_PickListController.getAgentDetails('LMSProperty-000013','LMSCustomer-00224');
        System.assertEquals('No details found','No details found'); 
         LMS_PickListController.getAgentDetails('LMSProperty-030013','LMSCustomer-00224');
        System.assertEquals('No details found','No details found'); 
        Test.stopTest();
    } 
    
}