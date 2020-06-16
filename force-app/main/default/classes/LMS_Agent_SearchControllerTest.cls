@isTest public class LMS_Agent_SearchControllerTest {
 @isTest static void fetchAgentTest()
    {
        
        Test.startTest();
        LMS_Agent_SearchController.fetchAgent();
        System.assertEquals('Fetch Successfully','Fetch Successfully');
        Test.stopTest();
   
    }
    @isTest static void fetchOwnerTest()
    {
        
        Test.startTest();
        LMS_Agent_SearchController.fetchOwner();
        System.assertEquals('Fetch Successfully','Fetch Successfully');
        Test.stopTest();
   
    }
    @isTest static void fetchCustomerTest()
    {
        
        Test.startTest();
        LMS_Agent_SearchController.fetchCustomer();
        System.assertEquals('Fetch Successfully','Fetch Successfully');
        Test.stopTest();
   
    }
}