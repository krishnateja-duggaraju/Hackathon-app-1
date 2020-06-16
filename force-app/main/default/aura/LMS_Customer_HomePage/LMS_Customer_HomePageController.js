({
	RecentHistory : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Customer_History",
        componentAttributes: {
            	customerId : component.get("v.customerId")
                   
        	}
      
    });
    evt.fire();
    },
     SearchProperty:function(component, event, helper){
        var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Customer_PropertySearch",
                    componentAttributes: {
            	customerId : component.get("v.customerId")
                   
        	}
				
			});
			evt.fire();
    }
    
})