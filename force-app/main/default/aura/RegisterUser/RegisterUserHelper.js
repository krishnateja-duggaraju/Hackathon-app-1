({
	createUser : function(component, newUser) {
		var action = component.get("c.regUser");
        action.setParams({ user : newUser });
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(action);

	}
})