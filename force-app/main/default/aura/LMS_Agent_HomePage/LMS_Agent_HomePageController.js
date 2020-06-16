({
	fetchProspecting : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Agent_Home",
        componentAttributes: {
            	agentId : component.get("v.agentId")
                   
        	}
      
    });
    evt.fire();
    },
    SearchPage : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:LMS_Agent_SearchPage",
        componentAttributes: {
            	agentId : component.get("v.agentId")
                   
        	}
      
    });
    evt.fire();
    },
    OppPage : function (component, event, helper) {
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        homeEvent.setParams({
            "scope": "Opportunity"
        });
        homeEvent.fire();
    }

})