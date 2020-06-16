({
    
    SearchHistoryHelper: function(component, event, ownerId) {
    // show spinner message
     component.find("Id_spinner").set("v.class" , 'slds-show');
    var action = component.get("c.fetchRecentHistory");
        action.setParams({ ownerId : ownerId
                          });
         action.setCallback(this, function(response) {
             
       // hide spinner when response coming from server 
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        var state = response.getState();
             console.log(state);
        if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();
			console.log(response.getReturnValue());
            // if storeResponse size is 0 ,display no record found message on screen.
            if (storeResponse.length == 0) {
                component.set("v.HistoryMessage", true);
            } else {
                component.set("v.HistoryMessage", false);
            }

            // set numberOfRecord attribute value with length of return value from server
            component.set("v.TotalNumberOfHistoryRecord", storeResponse.length);

            // set searchResult list with return value from server.
            component.set("v.searchHistoryResult", storeResponse); 
            console.log(component.get(v.searchHistoryResult));

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