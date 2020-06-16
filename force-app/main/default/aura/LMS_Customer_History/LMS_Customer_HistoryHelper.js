({
    
    SearchHistoryHelper: function(component, event, customerId) {
    // show spinner message
     component.find("Id_spinner").set("v.class" , 'slds-show');
    var action = component.get("c.fetchRecentHistory");
        action.setParams({ customerId : customerId
                          });
        var self=this;
       
         action.setCallback(this, function(response) {
             component.set('v.searchHistoryResult',response.getReturnValue());
       // hide spinner when response coming from server 
        component.find("Id_spinner").set("v.class" , 'slds-hide');
        var state = response.getState();
             console.log(state);
        if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();
            
			console.log(response.getReturnValue());
            
            /*for(var i=0;i<storeResponse.length;i++){
                console.log(response.getReturnValue()[i].stage);
                if(response.getReturnValue()[i].stage==='LMS_NegotiotiansComplete'){
                    console.log('hi');
                    component.set('v.isbutton', true);
                    component.set('v.isplaceholder', false);
             } 
                else {
            component.set('v.isbutton', false);
            component.set('v.isplaceholder', true);
                }
            }*/
           // console.log(component.get("v.searchHistoryResult", response.getReturnValue()[0].stage));
//console.log(storeResponse.length());
//console.log(storeResponse[0]);           

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