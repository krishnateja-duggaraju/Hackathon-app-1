({
    clickSubmit : function(component, event, helper) {
      //  console.log('true');
       // var option=component.get("v.value");
		var evt = $A.get("e.force:navigateToComponent");
				console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Agent_HomePage",
				componentAttributes :{
                agentId : component.get("v.agentId")
                }
			});
			evt.fire();
    }
})