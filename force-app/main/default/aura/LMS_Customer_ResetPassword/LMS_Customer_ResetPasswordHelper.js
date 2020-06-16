({
	getCustomer : function(component, email) {
		var action = component.get("c.lms_GetCustomer");
        action.setParams({ email : email });
        action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
            if(data.getReturnValue() != null) {
                component.set('v.cust', data.getReturnValue() );
                console.log(component.get('v.cust'));
                component.set('v.result', true);
                
            } else {
                alert('no details found');
            }
        });
        $A.enqueueAction(action);
	},
    
    
    resetPassword : function(component, cust, pwd) {
        var action = component.get("c.lms_ResetPassword");
        action.setParams({ cust : cust,
                          pwd: pwd});
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if(response.getReturnValue() == true) {
               alert('password updated');
                document.location.reload();
                
            } else {
                alert('cannot update password');
                document.location.reload();
            }
        });
        $A.enqueueAction(action);
    }
})