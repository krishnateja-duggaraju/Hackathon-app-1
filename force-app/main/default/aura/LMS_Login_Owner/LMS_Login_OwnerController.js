({
	loginOwner : function(component, event, helper) {
		var email = component.get('v.email');
        var password = component.get('v.password');
        
        if($A.util.isEmpty(email) || $A.util.isUndefined(email)){
            alert('Please enter valid email');
            return;
        }  
         else if($A.util.isEmpty(password) ){
            alert('Please enter valid password');
            return;
        }
          else {
          		helper.ownerLogin(component, email, password);       
             }
	},
    navigateToMyComponent : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Owner_Registration_Component"
       
    });
    evt.fire();
    },
    navigateToForgotPassword : function(component, event, helper) {
        var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Owner_ForgotPassword_Component"
				//componentAttributes :{ }
			});
			evt.fire();
    }
    
})