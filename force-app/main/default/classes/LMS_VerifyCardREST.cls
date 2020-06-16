@RestResource(urlMapping='/verifyCard/*')
global with sharing class LMS_VerifyCardREST {
 	
    @HttpGet
    global static LMS_Payment__c lms_pay_Customer(){
        system.debug(RestContext.request.params.get('acno'));
        String accountnumber=RestContext.request.params.get('acno');

        integer cvv= Integer.valueOf(RestContext.request.params.get('cvv'));
        integer expiry_month=Integer.valueOf(RestContext.request.params.get('expiry_month'));
        integer expiry_year = Integer.valueOf(RestContext.request.params.get('expiry_year'));
        try{
        LMS_Payment__c pay=[Select  LMS_AccoutHolderName__c, LMS_NameOfBank__c From LMS_Payment__c 
                                                           where Name=:accountnumber and
              
                                                                       LMS_CVV__c=:cvv and LMS_Expiry_Month__c = :expiry_month and LMS_Expiry_Year__c = :expiry_year Limit 1];
        System.debug(pay);
       
            return pay;
        }
        catch(Exception e)
        {
             System.debug(e);
        }
        return null;
                              
    }
}