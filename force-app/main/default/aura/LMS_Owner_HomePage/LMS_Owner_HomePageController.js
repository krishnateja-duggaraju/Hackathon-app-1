({
    getCustomers : function(component, event, helper) {
        
        var locality = component.get('v.locality');
         var contactList = component.get("v.contactList");
        //console.log(contactList);
        
         
        if(locality != null) {
            helper.getCustomers(component,locality);
           
        }             
		
	},
    RecentHistory : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Customer_HistoryOnOwnerPage",
        componentAttributes: {
            	ownerId : component.get("v.ownerId")
                   
        	}
      
    });
    evt.fire();
    },
    
})