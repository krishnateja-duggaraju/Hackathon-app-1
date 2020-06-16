@isTest
public class LMS_RESTTest {
@isTest
    static void verifyCardRESTTest() {
        String acno = 'LMS-AC-00001';
        String cvv = '499';
        String expMonth = '02';
        String expYear = '2020';
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        request.requestUri = 'lmspocvirtusa-dev-ed.my.salesforce.com/services/apexrest/verifyCard';
        System.debug(request.requestUri);
        request.httpMethod = 'GET';
        request.addParameter('acno', acno);
        request.addParameter('cvv', cvv);
        request.addParameter('expiry_month', expMonth);
        request.addParameter('expiry_year', expYear);
        
       
        RestContext.request = request;
        RestContext.response = response;
        LMS_Payment__c pay = LMS_VerifyCardREST.lms_pay_Customer();
        System.debug(RestContext.response);

 

    }
}