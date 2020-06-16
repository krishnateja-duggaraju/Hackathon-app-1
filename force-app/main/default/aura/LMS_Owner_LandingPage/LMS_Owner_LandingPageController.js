({    clickSubmit : function(component, event, helper) {
        var evt=$A.get("e.force:navigateToComponent");
        console.log('evt'+evt);
        evt.setParams({
            componentDef:"c:LMS_Owner_HomePage",
            componentAttributes: {
            	ownerId : component.get("v.ownerId")
        	}
        });
        evt.fire();
    
    
    }
})