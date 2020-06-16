({
	getOwner : function(component, email) {
		var action = component.get("c.lms_GetOwner");
        action.setParams({ email : email });
        action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
            if(data.getReturnValue() != null) {
                component.set('v.owner', data.getReturnValue() );
                console.log(component.get('v.owner'));
                component.set('v.result', true);
                
            } else {
                alert('no details found');
            }
        });
        $A.enqueueAction(action);
	},
    
    
    resetPassword : function(component, owner, pwd) {
        var action = component.get("c.lms_ResetPassword");
        action.setParams({ owner : owner,
                          pwd: pwd});
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if(response.getReturnValue() == true) {
               alert('password updated');
                var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Login_Owner"
				//componentAttributes :{ }
			});
			evt.fire();
                //document.location.reload();
                
            } else {
                alert('cannot update password');
                document.location.reload();
            }
        });
        $A.enqueueAction(action);
    }
})