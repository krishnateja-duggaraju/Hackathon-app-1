@isTest public class LMS_OwnerControllerTest {
   @isTest static void lms_ResetPasswordTest()
    {
        LMS_Owner__c owner=new LMS_Owner__c(
                        LMS_OwnerFirstName__c= 'Yamuna',
                        LMS_OwnerLastName__c= 'Bezawada',
                        LMS_OwnerEmail__c	= 'yamunabezawada99@gmail.com',
                        LMS_OwnerPassword__c= 'Qwerty1$',
                        LMS_OwnerPhone__c='9988776655' ,
                        LMS_OwnerAddress__c= '',
                        LMS_OwnerCountry__c= '',
                        LMS_OwnerState__c= '',
                        LMS_OwnerCity__c='',
                        LMS_OwnerPostalCode__c= '');
         LMS_Owner__c owner2=new LMS_Owner__c(
                        LMS_OwnerFirstName__c= 'test1',
                        LMS_OwnerLastName__c= 'test2',
                        LMS_OwnerEmail__c	= 'test3@gmail.com',
                        LMS_OwnerPassword__c= 'test@12',
                        LMS_OwnerPhone__c='9543278279' ,
                        LMS_OwnerAddress__c= '',
                        LMS_OwnerCountry__c= '',
                        LMS_OwnerState__c= '',
                        LMS_OwnerCity__c='',
                        LMS_OwnerPostalCode__c= '');
        Test.startTest();
        LMS_Owner_ForgotPasswordcontroller.lms_ResetPassword(owner,'Yamuna@12');
        System.assertEquals('Login Successfully','Login Successfully');
        LMS_Owner_ForgotPasswordcontroller.lms_ResetPassword(owner,'Qwerty1$');
        System.assertEquals('Same as old Password','Same as old Password'); 
        LMS_Owner_ForgotPasswordcontroller.lms_ResetPassword(owner2,'Yamuna@123');
        System.assertEquals('User does not exists!','User does not exists!'); 
        Test.stopTest();
 
    }
   
     @isTest public static void lms_GetOwnerTest() {
        
        LMS_Owner__c owner = null;
        try {
         owner = [SELECT Id, LMS_OwnerSecurityQuestion__c, LMS_OwnerAnswer__c, LMS_OwnerPassword__c,
                          LMS_OwnerConfirmPassword__c FROM LMS_Owner__c
                      WHERE LMS_OwnerEmail__c =: 'yamunabezawada99@gmail.com' limit 1];
            
        } catch(Exception e) {
            System.debug(e.getMessage());
        } finally {
        	Test.startTest();
        
        System.assertEquals(owner,LMS_Owner_ForgotPasswordcontroller.lms_GetOwner('yamunabezawada99@gmail.com'));
        
        System.assertEquals(null,LMS_Owner_ForgotPasswordcontroller.lms_GetOwner('yamunab123@gmail.com')); 
        
        Test.stopTest();
       
        }
        
    }
    @isTest public static void lms_GetCustomersTest(){
        Test.startTest();
        LMS_Owner_Search_Controller.lms_GetCustomers('Saroor Nagar');
        System.assertEquals('Display Customer Details','Display Customer Details'); 
        LMS_Owner_Search_Controller.lms_GetCustomers('Motinagar');
        System.assertEquals('No customers found!','No customers found!'); 
        Test.stopTest();
    }
    @isTest static void fetchPropertyTest()
    {
        
        Test.startTest();
        LMS_Owner_Search_Controller.fetchProperty();
        System.assertEquals('Fetch Successfully','Fetch Successfully');
        Test.stopTest();
   
    }
 /* @isTest public static void createPropertyTest(){
        
        LMS_Property__c property=new LMS_Property__c(
            			//LMS_Owner__c='LMSOwner-00002',
            			LMS_Property_Type__c='Bungalow',
                        LMS_Property_Details__c= '3BHK',
                        LMS_Property_Sale_Value__c= 3000,
                        
                       LMS_Property_Rental_Value_Month__c	= 4000,
                        LMS_Total_Area__c= 1000,
                        LMS_City__c='Guntur' ,
                        LMS_Locality__c= 'Tenali',
                        LMS_Address__c= '',
                       LMS_State__c= 'Andra Pradesh',
                        Country__c='India',
            			LMS_Owner__c='LMSOwner-00002',
            			LMS_Agent__c='LMS-Agent-0004',
            			Agent_Name__c='gurajalla',
            			Agent_Phone__c='9999999999'
                        );
        LMS_Agent__c agent = null;
       //property.LMS_Owner__c = 'LMSOwner-00002';
        try {
             agent = [SELECT Id, LMS_AgentFirstName__c,	LMS_AgentPhone__c FROM LMS_Agent__c WHERE LMS_Agent_Locality__c ='Karmanghat' limit 1];
        } catch(Exception e) {
            System.debug(e.getMessage());
        }
        finally{
        Test.startTest();
            
           String ownerId='LMSOwner-00002';
                
      		 System.assertEquals(true,LMS_Owner_Search_Controller.createProperty(ownerId,property));
        	System.assertEquals(false,LMS_Owner_Search_Controller.createProperty('001',property));
            
        Test.stopTest();
        }
    
   }*/
   @isTest static void fetchRecentHistorytTest()
    {
        
        Test.startTest();
        LMS_Owner_Search_Controller.fetchRecentHistory('LMSOwner-00002');
        System.assertEquals('Displayed Successfully','Displayed Successfully');
         
        Test.stopTest();
   
    }
    @isTest static void getCustomerNameTest()
    {
        
        Test.startTest();
        LMS_Owner_Search_Controller.getCustomerName('LMSCustomer-00024');
        System.assertEquals('Retrived','Retrived');
        LMS_Owner_Search_Controller.getCustomerName('LMSCustomer-00224');
        System.assertEquals('No details found','No details found'); 
        Test.stopTest();
    }
    @isTest static void getAgentNameTest()
    {
     Test.startTest();
        LMS_Owner_Search_Controller.getAgentName('LMS-Agent-0022');
        System.assertEquals('Retrived','Retrived');
        LMS_Owner_Search_Controller.getAgentName('LMS-Agent-0222');
        System.assertEquals('No details found','No details found'); 
        Test.stopTest();
    }
   /* @isTest public static void getNamesTest()
    {
        LMS_Customer__c  customer = [select Name from LMS_Customer__c
                                Where  Id =:'LMSCustomer-00024'limit 1];
         
         LMS_Agent__c  agent = [select Name from LMS_Agent__c
                                Where  Id =:'LMS-Agent-0022'];
         LMS_Property__c  property = [select Name from LMS_Property__c
                     Where  Id =:'LMSProperty-000010'];
        Test.startTest();
		LMS_Owner_Search_Controller.getNames('LMSCustomer-00024', 'LMS-Agent-0022', 'LMSProperty-000010');
		//LMS_Owner_Search_Controller.getNames('LMSCustomer-00109', 'LMS-Agent-0222', 'LMSProperty-000109'); 
		test.startTest();        
	}*/
    
}