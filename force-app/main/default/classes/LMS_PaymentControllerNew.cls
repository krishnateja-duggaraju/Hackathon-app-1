public class LMS_PaymentControllerNew {
    @AuraEnabled
    public static LMS_Payment__c verifyCard(String accountnumber,integer cvv,integer expiry_month, integer expiry_year, String amount, String customerId, String PropertyName) {
        LMS_Payment__c pay = null;
        String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();

		String restAPIURL = sfdcURL + '/services/apexrest/verifyCard?acno='+accountnumber+'&cvv='+cvv+'&expiry_month='+expiry_month+'&expiry_year='+expiry_year; 
		String accessTokenURL = 'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9Kip4IKAZQEVRszeHj38t_380iYowjpmxAqFiYKLUqbVH4AuWGAsZ3r3sORRDOU2xMSUELbAoN296R8hx&client_secret=49FFE557B453D3DDB201B14ECBBF8EBABB0853AB74AF9ED08425B3EDC5A1FCFF&username=pranathisanju10@gmail.com&password=Salesforceswag6';
        
		HttpRequest httpRequest = new HttpRequest();
        HttpRequest accesstokenRequest = new HttpRequest(); 
		
        accesstokenRequest.setMethod('POST');
        accesstokenRequest.setEndpoint(accessTokenURL);
        Http accessTokenHttp = new Http();
        HttpResponse accessTokenResponse = accessTokenHttp.send(accesstokenRequest); 
        String accessTokenString = JSON.serializePretty( JSON.deserializeUntyped(accessTokenResponse.getBody()) );
        Map<String, Object> tokenMap = (Map<String, Object>) JSON.deserializeUntyped(accessTokenString);
        
        String accessToken = (String)tokenMap.get('access_token');
        system.debug('Access token '+accessToken);
        
		httpRequest.setMethod('GET');  

		httpRequest.setHeader('Content-Type', 'application/json');       

		httpRequest.setHeader('Authorization','Bearer '+accessToken);

		httpRequest.setEndpoint(restAPIURL); 

		String response = '';

		try { 

         	Http http = new Http();  

         	HttpResponse httpResponse = http.send(httpRequest); 

         	if (httpResponse.getStatusCode() == 200 ) { 
               	response = JSON.serializePretty( JSON.deserializeUntyped(httpResponse.getBody()) );
                pay = (LMS_Payment__c)JSON.deserialize(response,LMS_Payment__c.class ); 
                LMS_Transaction__c trans = new LMS_Transaction__c();
        		trans.LMS_Transaction_Amount__c =  Decimal.valueOf(amount);
        		trans.LMS_Account_Number__c = accountnumber;
                trans.LMS_Customer_Email__c = LMS_Utility.getCustomerEmail(customerId);
                trans.LMS_Owner_Email__c = LMS_Utility.ownerEmailFromPropertyName(PropertyName);
                trans.LMS_Agent_Email__c = LMS_Utility.agentEmailFromPropertyName(PropertyName);
                trans.LMS_Property__c = LMS_Utility.propertyIdFromPropertyName(PropertyName);
                
                
                system.debug(trans);
        		Database.SaveResult result = Database.insert(trans);

         	} else { 

             	System.debug('httpResponse ' + httpResponse.getBody() ); 

               	throw new CalloutException( httpResponse.getBody() );
         	}  

		} catch( System.Exception e) { 

         	System.debug('ERROR: '+ e);
            pay = null;

		} 

		System.debug(' ** response ** : ' + response ); 
        
        return pay;
    }
    
   
        
    }