({
    getCustomers : function(component, event, helper) {
        
        var locality = component.get('v.locality');
         var contactList = component.get("v.contactList");
        //console.log(contactList);
        
         
        if(locality != null) {
            helper.getCustomers(component,locality);
           
        }             
		
	},
    
    
    addProperty : function(component, event, helper) {
        var evt=$A.get("e.force:navigateToComponent");
        console.log('evt'+evt);
        evt.setParams({
            componentDef:"c:LMS_AddingBuildingDetails_Component",
            componentAttributes: {
            	ownerId : component.get("v.ownerId")
        	}
        });
        evt.fire();
       
    },
    
    doinit1 : function(component, event, helper) {
        var action = component.get('c.fetchProperty');
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);
            if(state === "SUCCESS"){
                var allValues = response.getReturnValue();
                console.log("allValues--->>> " + allValues);
                component.set('v.mydata', allValues);
            }
            else if(state === "ERROR") {
                var errors = response.getError();
                if(errors){
                    if(errors[0] && errors[0].message){
                        console.log("Error Message: " + errors[0].message);
                    }
                }
                else{
                    console.log("Unknown Error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    newPopup : function(component, event, helper){
        var cmpTarget = component.find('Modalbox1');
        var cmpBack = component.find('Modalbackdrop');
        $A.util.addClass(cmpTarget, 'slds-fade-in-open');
        $A.util.addClass(cmpBack, 'slds-backdrop--open');
    },
    
    saveModal : function(component, event, helper){
        
        var ownerId=component.get("v.ownerId");
        var regForm = component.get("v.homePage");
        console.log(ownerId);
        console.log(regForm);
        
        var action = component.get("c.createProperty");
        action.setParams({ownerId:ownerId,property  : regForm});
        action.setCallback(this, function(response) {
            var state = response.getReturnValue(); 
            console.log(state);
            if (state == true) {
                $A.get('e.force:refreshView').fire();
                var cmpTarget = component.find('Modalbox1');
                var cmpBack = component.find('Modalbackdrop');
                $A.util.removeClass(cmpBack,'slds-backdrop--open');
                $A.util.removeClass(cmpTarget, 'slds-fade-in-open');
                
            }
            else  {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } 
                else {
                    console.log(response.getReturnValue());
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    closeNewModal : function(component, event, helper){
        var cmpTarget = component.find('Modalbox1');
        var cmpBack = component.find('Modalbackdrop');
        $A.util.removeClass(cmpBack,'slds-backdrop--open');
        $A.util.removeClass(cmpTarget, 'slds-fade-in-open');
    },
  
    
})