@isTest public class HackathonTest {
    @isTest static void fetchApexTest()
    {
        
        Test.startTest();
        Hackathon.fetchApexTest();
        System.assertEquals('Fetch Successfully','Fetch Successfully');
        Test.stopTest();
   
    }
    @isTest static void fetchApex()
    {
        
        Test.startTest();
        Hackathon.fetchApex();
        System.assertEquals('Fetch Successfully','Fetch Successfully');
        Test.stopTest();
   
    }

}