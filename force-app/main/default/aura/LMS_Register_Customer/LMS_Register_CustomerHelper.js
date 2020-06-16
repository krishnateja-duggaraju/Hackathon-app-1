({
    createUser : function(component, newUser) {
        var action = component.get("c.lms_Register_Customer");
        action.setParams({ user : newUser });
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if(response.getReturnValue()==true)
              {
                var evt = $A.get("e.force:navigateToComponent");
                alert('registration sucessful')
                console.log('evt'+evt);
                evt.setParams({
                componentDef: "c:LMS_Login_Customer"
                //componentAttributes :{ }
            });
            evt.fire();
           } else {
                alert('Customer registration was not sucessful, please check details');
            }
        });
        $A.enqueueAction(action);

 

    },
    
    navigateToLogin : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Login_Customer"
       
    });
    evt.fire();
    }
})