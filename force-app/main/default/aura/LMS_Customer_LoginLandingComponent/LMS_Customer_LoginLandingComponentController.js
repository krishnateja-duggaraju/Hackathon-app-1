({
    clickSubmit : function(component, event, helper) {
      //  console.log('true');
       // var option=component.get("v.value");
       console.log(component.get("v.customerId") );
		var evt = $A.get("e.force:navigateToComponent");
				evt.setParams({
				componentDef: "c:LMS_Customer_HomePage",
			
                componentAttributes: {
            	customerId : component.get("v.customerId")
                   
        	}
                
			});
        
			evt.fire();
    }
})