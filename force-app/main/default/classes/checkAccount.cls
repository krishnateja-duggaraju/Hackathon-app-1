@RestResource(urlMapping='/showAccountsDetails/*')
global with sharing class checkAccount {
 @HttpGet
    global static LIST<LMS_Payment__c> getAccount(){
        LIST<LMS_Payment__c> lst;
        try{
            lst=[select Name,LMS_CVV__c from LMS_Payment__c];
            return lst;
        }
        catch(Exception ex){
            System.debug('Error'+ex.getMessage());
        }
        return lst;
    }
}