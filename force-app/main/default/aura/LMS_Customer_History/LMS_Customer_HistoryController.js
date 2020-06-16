({
		
	doInit:function(component,event,helper){
        var customerId = component.get('v.customerId');
        console.log('customer '+customerId);
        helper.SearchHistoryHelper(component,event, customerId);
    },
    navigateToMyComponent : function(component, event, helper) {
        var propName = event.target.id;
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Payment",
        componentAttributes :
                    {
                    customerId : component.get("v.customerId"),
                        PropertyName : propName
                }
       
    });
    evt.fire();
    }
})