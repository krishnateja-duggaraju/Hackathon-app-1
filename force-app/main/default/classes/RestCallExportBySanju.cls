@RestResource(urlMapping='/SanjuRestCallPractise/*')
global with sharing class RestCallExportBySanju {

    @HttpGet
    global static Account doGet(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String sAccId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account objAccInfo = [select id, name, phone, description from Account where id =: sAccId];
        
        return objAccInfo;
    }
    
}