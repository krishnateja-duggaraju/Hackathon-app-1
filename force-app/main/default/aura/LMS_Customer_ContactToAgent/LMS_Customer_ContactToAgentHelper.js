({
    
    SearchAgentHelper: function(component, event, agentId) {
    // show spinner message
     component.find("Id_spinner").set("v.class" , 'slds-show');
    var action = component.get("c.fetchAgent");
        action.setParams({ agentId : agentId
                          });
         action.setCallback(this, function(response) {
       // hide spinner when response coming from server 
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        var state = response.getState();
        if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();
			console.log(response.getReturnValue());
            // if storeResponse size is 0 ,display no record found message on screen.
            if (storeResponse.length == 0) {
                component.set("v.AgentMessage", true);
            } else {
                component.set("v.AgentMessage", false);
            }

            // set numberOfRecord attribute value with length of return value from server
            component.set("v.TotalNumberOfAgentRecord", storeResponse.length);

            // set searchResult list with return value from server.
            component.set("v.searchAgentResult", storeResponse); 
            console.log(component.get(v.searchAgentResult));

        }else if (state === "INCOMPLETE") {
            alert('Response is Incompleted');
        }else if (state === "ERROR") {
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    alert("Error message: " + 
                                errors[0].message);
                }
            } else {
                alert("Unknown error");
            }
        }
    });
    $A.enqueueAction(action);
}
	
})