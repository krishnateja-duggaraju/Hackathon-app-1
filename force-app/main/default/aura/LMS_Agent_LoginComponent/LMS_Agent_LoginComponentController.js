({
    clickLogin : function(component, event, helper) {
        var action = component.get("c.lms_Agent_loginDetails");
        
        var userId = component.get("v.userName"); 
        var pswd= component.get("v.password");
        
        if($A.util.isEmpty(userId) || $A.util.isUndefined(userId)){
            alert('Please Enter User Name!');
            return;
        }   
         if($A.util.isEmpty(pswd) || $A.util.isUndefined(pswd)){
            alert('Please Enter Password!');
            return;
        } 
          action.setParams({
              userName:userId,
              password:pswd
        });
          action.setCallback(this,function(a){
              var rtnValue = a.getReturnValue();
              alert(rtnValue);
              if(rtnValue=='Login Successfully')
              {
                var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Agent_LoginLandingComponent"
				//componentAttributes :{ }
			});
			evt.fire();
           }
              
              console.log('The field list is :'+JSON.stringify(a.getReturnValue()));
          });
         $A.enqueueAction(action);
         component.set("v.userId",'');
         component.set("v.pswd",'');
    },
    clickRegister:function(component, event, helper){
        var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Agent_RegistrationComponent"
				//componentAttributes :{ }
			});
			evt.fire();
    },
    clickForgotPassword:function(component, event, helper){
        var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Agent_ForgotPwd"
				//componentAttributes :{ }
			});
			evt.fire();
    }
    
})