@isTest
private class LMS_CustomerControllerTest {
    
    
    @isTest public static void lms_Register_CustomerTest() {
        integer i=0; 
        i=i+1;
        LMS_Customer__c customer = new LMS_Customer__c(LMS_Last_Name__c= 'teja',
                                                            LMS_Email__c= 'kt'+i+'@gmail.com',
                                                            LMS_Password__c='password'+i);
        System.assertEquals(false,LMS_CustomerController.lms_Register_Customer(customer));
    
    }
    
    @isTest 
    public static void lms_Login_CustomerTest() {
        String email = 'email', password='password';
        System.assertEquals(null,LMS_CustomerController.lms_Login_Customer(email,password));
    
    }
    
    
      @isTest public static void lms_Customer_ForgotPwdTest() {
         Test.startTest();
        LMS_CustomerController.lms_Customer_ForgotPwd('yamunabezawada99@gmail.com','In what city you are born?','chennai');
        System.assertEquals('Verified Successfully','Verified Successfully');
        LMS_CustomerController.lms_Customer_ForgotPwd('yamunabezawada99@gmail.com','In what city you are born?','hydrabad');
        System.assertEquals('Invalid Details','Invalid Details'); 
        LMS_CustomerController.lms_Customer_ForgotPwd('yamunabezawada@gmail.com','In what city you are born?','chennai');
        System.assertEquals('User does not exists!','User does not exists!'); 
        Test.stopTest();
   
    }
    
    @isTest static void lms_ResetPasswordTest()
    {
        LMS_Customer__c customer=new LMS_Customer__c(
                        LMS_First_Name__c= 'Aarthi',
                        LMS_Last_Name__c= 'Sampath',
                        LMS_Email__c	= 'aarthi@gmail.com',
                        LMS_Password__c= 'Aarthi@12',
                        LMS_Phone__c='9291759279' ,
                        LMS_CustomerAddress__c= '',
                        LMS_CustomerCountry__c= '',
                        LMS_CustomerState__c= '',
                        LMS_CustomerCity__c='',
                        LMS_CustomerPostalCode__c= '');
         LMS_Customer__c customer2=new LMS_Customer__c(
                        LMS_First_Name__c= 'test1',
                        LMS_Last_Name__c= 'test2',
                        LMS_Email__c	= 'test3@gmail.com',
                        LMS_Password__c= 'test@12',
                        LMS_Phone__c='9543278279' ,
                        LMS_CustomerAddress__c= '',
                        LMS_CustomerCountry__c= '',
                        LMS_CustomerState__c= '',
                        LMS_CustomerCity__c='',
                        LMS_CustomerPostalCode__c= '');
        Test.startTest();
        LMS_CustomerController.lms_ResetPassword(customer,'Sanju@12');
        System.assertEquals('Reset Successfully','Reset Successfully');
        LMS_CustomerController.lms_ResetPassword(customer,'Aarthi@12');
        System.assertEquals('Same as old Password','Same as old Password'); 
        LMS_CustomerController.lms_ResetPassword(customer2,'S@123');
        System.assertEquals('User does not exists!','User does not exists!'); 
        Test.stopTest();
 
    }
    
   @isTest static void fetchAgentTest()
    {
        
        Test.startTest();
        LMS_CustomerController.fetchAgent('LMS-Agent-0006');
        System.assertEquals('Displayed Successfully','Displayed Successfully');
        LMS_CustomerController.fetchAgent('LMS-Agent-5000');
        System.assertEquals('Agent does not exist','Agent does not exist'); 
        
   
    }
    
     @isTest static void fetchRecentHistorytTest()
    {
        
        Test.startTest();
        LMS_CustomerController.fetchRecentHistory('LMSCustomer-00009');
        System.assertEquals('Displayed Successfully','Displayed Successfully');
        LMS_CustomerController.fetchAgent('LMSCustomer-50009');
        System.assertEquals('Customer does not exist','Customer does not exist'); 
        
   
    }
    @isTest
    static void lms_GetCustomerPassTest() {
        LMS_Customer__c cust = null;
        String email = 'krishnateja33@gmail.com';
        try {
            cust = [SELECT Id, LMS_CustomerSecurityQuestion__c, LMS_CustomerAnswer__c, LMS_Password__c
                      FROM LMS_Customer__c
                      WHERE LMS_Email__c =: email limit 1];
            
        } catch(Exception e) {
            system.debug(e.getMessage());
        
        } finally {
            Test.startTest();
            system.assertEquals(cust, LMS_CustomerController.lms_GetCustomer('krishnateja33@gmail.com'));
        	system.assertEquals(null, LMS_CustomerController.lms_GetCustomer('email@gmail.com'));
        	Test.stopTest();
        }
        
        
    }
    
    @isTest
    static void lms_GetCustomerFailTest() {
        Test.startTest();
        system.assertEquals(null, LMS_CustomerController.lms_GetCustomer('email@gmail.com'));
        
        Test.stopTest();
    }
    
    @isTest static void getAgentDetailsTest()
    {
     Test.startTest();
        LMS_PickListController.getAgentDetails('LMSProperty-000007','LMSCustomer-00012');
        System.assertEquals('Retrived','Retrived');
        LMS_PickListController.getAgentDetails('LMSProperty-000007','LMSCustomer-60009');
        System.assertEquals('No details found','No details found'); 
        LMS_PickListController.getAgentDetails('LMSProperty-500007','LMSCustomer-00012');
        System.assertEquals('No details found','No details found'); 
        LMS_PickListController.getAgentDetails('LMSProperty-600007','LMSCustomer-60009');
        System.assertEquals('No details found','No details found'); 
        Test.stopTest();
    }
    
}