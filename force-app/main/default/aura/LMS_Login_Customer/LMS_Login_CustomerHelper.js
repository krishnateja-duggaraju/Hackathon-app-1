({
	customerLogin : function(component, username, password) {
		var action = component.get("c.lms_Login_Customer");
        action.setParams({ username : username,
                          password: password});
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if(response.getReturnValue() != null) {
              component.set('v.customer', response.getReturnValue() );

                alert('login sucessful');
                
                var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Customer_LoginLandingComponent",
                    componentAttributes :
                    {
                    customerId : component.get("v.customer.Id")
                }
 
			});
			evt.fire();
            } else {
                alert('username or password incorrect!');
            }
        });
        $A.enqueueAction(action);
	}
    
    

})