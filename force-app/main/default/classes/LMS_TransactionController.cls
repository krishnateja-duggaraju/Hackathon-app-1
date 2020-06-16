public class LMS_TransactionController {

    @AuraEnabled
    public static boolean lms_doPayment(String amount, LMS_Payment__c acc) {
        system.debug('@@@@@@@@@@@@@@ Method Entry @@@@@@@@@@@@@@');
        system.debug(amount);
        system.debug(acc);
        LMS_Transaction__c trans = new LMS_Transaction__c();
        trans.LMS_Transaction_Amount__c =  Decimal.valueOf(amount);
        trans.LMS_Account_Number__c = acc.LMS_AccoutHolderName__c;
     
        Database.SaveResult result = Database.insert(trans);
        if(result.isSuccess()) {
            return true;
        }
        else {
            system.debug(result.getErrors());
            return false;
        }
        
}
}