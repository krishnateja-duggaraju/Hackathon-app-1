({
	SearchOwnerHelper: function(component, event) {
    // show spinner message
     component.find("Id_spinner").set("v.class" , 'slds-show');
    var action = component.get("c.fetchOwner");
         action.setCallback(this, function(response) {
       // hide spinner when response coming from server 
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        var state = response.getState();
        if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();

            // if storeResponse size is 0 ,display no record found message on screen.
            if (storeResponse.length == 0) {
                component.set("v.OwnerMessage", true);
            } else {
                component.set("v.OwnerMessage", false);
            }

            // set numberOfRecord attribute value with length of return value from server
            component.set("v.TotalNumberOfOwnerRecord", storeResponse.length);

            // set searchResult list with return value from server.
            component.set("v.searchOwnerResult", storeResponse); 

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
    },
    
    SearchCustomerHelper: function(component, event) {
    // show spinner message
     component.find("Id_spinner").set("v.class" , 'slds-show');
    var action = component.get("c.fetchCustomer");
         action.setCallback(this, function(response) {
       // hide spinner when response coming from server 
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        var state = response.getState();
        if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();

            // if storeResponse size is 0 ,display no record found message on screen.
            if (storeResponse.length == 0) {
                component.set("v.CustomerMessage", true);
            } else {
                component.set("v.CustomerMessage", false);
            }

            // set numberOfRecord attribute value with length of return value from server
            component.set("v.TotalNumberOfCustomerRecord", storeResponse.length);

            // set searchResult list with return value from server.
            component.set("v.searchCustomerResult", storeResponse); 

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