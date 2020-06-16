({
    createOwner : function(component, newOwner) {
        var action = component.get("c.registerAsOwner");
        action.setParams({ owner : newOwner });
        action.setCallback(this, function(response) {
            //console.log(response.getReturnValue());
            var returnval = response.getReturnValue();
        
        if(returnval==true)
        {
         var evt = $A.get("e.force:navigateToComponent");
    	 evt.setParams({
         componentDef : "c:LMS_Login_Owner"
        
    	});
        evt.fire();
        }
        else {
                alert('Please check details once');
            }
      });    
        $A.enqueueAction(action);     }
})