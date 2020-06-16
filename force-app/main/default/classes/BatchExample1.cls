global class BatchExample1 implements Database.Batchable<sObject>{

 


        global BatchExample1(){
              
        }
       
 
        global Database.QueryLocator start(Database.BatchableContext BC){
            string query = 'select id, casenumber,status, (SELECT Subject FROM EmailMessages) From case';
            return Database.getQueryLocator(query);
        }
      
       global void execute(Database.BatchableContext BC, List<Case> scope){
           List<Case> caseList = new List<Case>();
           for(Case c:scope){
              if(c.EmailMessages.size() > 0)
{
System.debug('::EmailMessages::'+c.EmailMessages);
    
}
               else{
                    c.status = 'Closed';
               }
                 
               
               caseList.add(c);
           }
           if(caselist.size()>0)
               update caseList;
          
       }
     
       global void finish(Database.BatchableContext BC){
          
       }
    

 

 


}