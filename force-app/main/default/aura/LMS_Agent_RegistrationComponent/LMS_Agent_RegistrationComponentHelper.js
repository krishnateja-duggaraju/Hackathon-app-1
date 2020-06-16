({
    createUser: function(component, newAgent) {
        var action = component.get("c.lms_Agent_addDetails");
        action.setParams({agentDetails:newAgent});
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
       action.setCallback(this, function(response) {
           var returnValue = response.getReturnValue();
              if(returnValue=='Registered Successfully')
              {
                var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Agent_LoginComponent"
				//componentAttributes :{ }
			});
			evt.fire();
           }
              alert(returnValue);
              console.log('The field list is :'+JSON.stringify(returnValue.getReturnValue()));
          
        });
        $A.enqueueAction(action);
        
    }
})