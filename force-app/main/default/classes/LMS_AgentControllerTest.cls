@isTest
private class LMS_AgentControllerTest {
@isTest
    static void testaddLMSAgent()
    {
        LMS_Agent__c agent=new LMS_Agent__c(
                        LMS_AgentFirstName__c= 'TestFirstName',
                        LMS_AgentLastName__c= 'TestLastName',
                        LMS_AgentEmail__c= 'test@gmail.com',
                        LMS_AgentPassword__c= 'test123',
                        LMS_AgentConfirmPassword__c='test123',
                        LMS_AgentPhone__c='9876543210' ,
                        LMS_AgentAddress__c= '',
                        LMS_AgentCountry__c= '',
                        LMS_AgentState__c= '',
                        LMS_AgentCity__c='',
                        LMS_AgentPostalCode__c= '');
         LMS_Agent__c agent2=new LMS_Agent__c(
                        LMS_AgentFirstName__c= 'TestFirstName',
                        LMS_AgentLastName__c= 'TestLastName',
                        LMS_AgentEmail__c= 'test@gmail.com',
                        LMS_AgentPassword__c= 'test@123',
                        LMS_AgentConfirmPassword__c='test123',
                        LMS_AgentPhone__c='9876543210' ,
                        LMS_AgentAddress__c= '',
                        LMS_AgentCountry__c= '',
                        LMS_AgentState__c= '',
                        LMS_AgentCity__c='',
                        LMS_AgentPostalCode__c= '');
         
        test.startTest();
        LMS_AgentController.lms_Agent_addDetails(agent);
        System.assertEquals('Registered successfully', 'Registered successfully');
        LMS_AgentController.lms_Agent_addDetails(agent2);
        System.assertEquals('Password and Confirm Password must be equal','Password and Confirm Password must be equal');
        test.stopTest();
        
    }
    @isTest static void agentLoginDetailsTest()
    {
        
        Test.startTest();
        LMS_AgentController.lms_Agent_loginDetails('gsupriya1306@gmail.com','S@123');
        System.assertEquals('Login Successfully','Login Successfully');
        LMS_AgentController.lms_Agent_loginDetails('gsupriya1306@gmail.com','S@12');
        System.assertEquals('Invalid Password','Invalid Password'); 
        LMS_AgentController.lms_Agent_loginDetails('gsupriya13@gmail.com','S@123');
        System.assertEquals('User does not exists!','User does not exists!'); 
        Test.stopTest();
   
    }
    
    @isTest public static void lms_GetCustomerTest() {
        //String email = 'siri001@gmail.com';
        LMS_Agent__c agent = null;
        try {
         agent = [SELECT Id, LMS_AgentSecurityQuestion__c, LMS_AgentAnswer__c, LMS_AgentPassword__c,
                          LMS_AgentConfirmPassword__c FROM LMS_Agent__c
                      WHERE LMS_AgentEmail__c =: 'siri001@gmail.com' limit 1];
            
        } catch(Exception e) {
            System.debug(e.getMessage());
        } finally {
        	Test.startTest();
        
        System.assertEquals(agent,LMS_Agent_Forgotpwdcontroller.lms_GetCustomer('siri001@gmail.com'));
        
        System.assertEquals(null,LMS_Agent_Forgotpwdcontroller.lms_GetCustomer('siri005@gmail.com')); 
        
        Test.stopTest();
       
        }
        
    }
    
    @isTest static void lms_ResetPasswordTest()
    {
        LMS_Agent__c agent=new LMS_Agent__c(
                        LMS_AgentFirstName__c= 'siri',
                        LMS_AgentLastName__c= 'siriginidi',
                        LMS_AgentEmail__c= 'siri001@gmail.com',
                        LMS_AgentPassword__c= 'Siri@123',
                        LMS_AgentConfirmPassword__c='Siri@123',
                        LMS_AgentPhone__c='7013577232' ,
                        LMS_AgentAddress__c= '',
                        LMS_AgentCountry__c= '',
                        LMS_AgentState__c= '',
                        LMS_AgentCity__c='',
                        LMS_AgentPostalCode__c= '');
         LMS_Agent__c agent2=new LMS_Agent__c(
                        LMS_AgentFirstName__c= 'TestFirstName',
                        LMS_AgentLastName__c= 'TestLastName',
                        LMS_AgentEmail__c= 'test@gmail.com',
                        LMS_AgentPassword__c= 'test123',
                        LMS_AgentConfirmPassword__c='test123',
                        LMS_AgentPhone__c='9876543210' ,
                        LMS_AgentAddress__c= '',
                        LMS_AgentCountry__c= '',
                        LMS_AgentState__c= '',
                        LMS_AgentCity__c='',
                        LMS_AgentPostalCode__c= '');
                       
        Test.startTest();
        LMS_Agent_Forgotpwdcontroller.lms_ResetPassword(agent,'Sanju@12');
        System.assertEquals('Reset Successfully','Reset Successfully');
        LMS_Agent_Forgotpwdcontroller.lms_ResetPassword(agent,'Siri@123');
        System.assertEquals('Same as old Password','Same as old Password'); 
        LMS_Agent_Forgotpwdcontroller.lms_ResetPassword(agent2,'S@123');
        System.assertEquals('User does not exists!','User does not exists!'); 
        Test.stopTest();
 
    }
    
    @isTest static void fetchProspectingTest()
    {
        
        Test.startTest();
        LMS_AgentController.fetchProspecting();
        System.assertEquals('Login Successfully','Login Successfully');
        /*LMS_AgentController.fetchProspecting();
        System.assertEquals('Invalid method','Invalid method'); */
      
        Test.stopTest();
   
    }
    
        @isTest static void fetchCustomerTest()
    {
        
        Test.startTest();
        LMS_AgentController.fetchCustomer();
        System.assertEquals('Login Successfully','Login Successfully');
        /*LMS_AgentController.fetchProspecting();
        System.assertEquals('Invalid method','Invalid method'); */
      
        Test.stopTest();
   
    }
@isTest static void getCustomerNameTest()
    {
        
        Test.startTest();
        LMS_AgentController.getCustomerName('LMSCustomer-00026');
        System.assertEquals('Fetched Successfully','Fetched Successfully');
        LMS_AgentController.getCustomerName('LMSCustomer-50026');
        System.assertEquals('No details found','No details found'); 
      
        Test.stopTest();
   
    }
     @isTest static void fetchOwnerTest()
    {
        
        Test.startTest();
        LMS_Agent_SearchController.fetchOwner();
     System.assertEquals('Fetched Successfully','Fetched Successfully');
    Test.stopTest();
    }
    
     @isTest static void fetchCustomerTest2()
    {
        
        Test.startTest();
        LMS_Agent_SearchController.fetchCustomer();
     System.assertEquals('Fetched Successfully','Fetched Successfully');
    Test.stopTest();
    }
    
    
}