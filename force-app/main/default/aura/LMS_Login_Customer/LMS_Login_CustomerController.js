({
	loginCustomer : function(component, event, helper) {
		var username = component.get('v.username');
        var password = component.get('v.password');
        console.log(username);
        
        if($A.util.isEmpty(username) ){
            alert('Please enter valid username');
            return;
        }  
         else if($A.util.isEmpty(password) ){
            alert('Please enter valid password');
            return;
        }
          else {
          		helper.customerLogin(component, username, password);       
             }
	},
    
    
    
    navigateToMyComponent : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Register_Customer"
       
    });
    evt.fire();
    },
     clickForgotPassword:function(component, event, helper){
        var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Customer_ResetPassword"
				//componentAttributes :{ }
			});
			evt.fire();
    }
    
    })