@isTest
public class PranathiTest {
    @isTest static void getDetailsTest(){
         List<String> selectedaminitiesList = new List<String> {'Car parking','Lift facilities','Pet friendly'};
     Test.startTest();
        LMS_PickListController.getDetails('Andhra Pradesh','India','Vizag','3BHK',true,true,selectedaminitiesList);
        System.assertEquals('List has no rows','List has no rows');
        LMS_PickListController.getDetails('Andhra Pradesh','Australia','Hyderabad','3BHK',true,false,selectedaminitiesList);
        System.assertEquals('No details found','No details found'); 
        Test.stopTest();
    }
}