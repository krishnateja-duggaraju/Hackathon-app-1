({
	getCustomers : function(component,locality) {
       
		var action = component.get("c.lms_GetCustomers");
        action.setParams({locality:locality });
       action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
             //action.setCallback(this, function(response) {
            //var state = response.getReturnValue(); 
            //console.log(state);
            //if (state == true) {
            if(data.getReturnValue() != null) {
                
                component.set('v.contactList', data.getReturnValue() );
                console.log(component.get('v.contactList'));
                component.set('v.result', true);
                
            } if(data.getReturnValue() == false){
                component.set('v.result', false);
                alert('No customers found');
            }
        
                           
        });
        $A.enqueueAction(action);
	},
})