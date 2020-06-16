({
	ownerLogin : function(component, email, password) {
		var action = component.get("c.lms_Login_Owner");
        action.setParams({ email : email,
                          password: password});
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if(response.getReturnValue() != null) {
                component.set('v.owner', response.getReturnValue() );
                alert('login sucessful');
                var evt = $A.get("e.force:navigateToComponent");
    	            evt.setParams({
                            componentDef : "c:LMS_Owner_LandingPage",
        					componentAttributes: {
            					ownerId : component.get("v.owner.Id")
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