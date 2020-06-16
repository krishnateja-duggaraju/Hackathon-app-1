({
	payNegoAmount : function(component, amount, acName) {
        console.log('in helper');
        console.log(acName);
        console.log(amount);
        var action = component.get("c.lms_doPayment");
        action.setParams({  amount: amount,
                          acc: acName
                         });
        
        action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
            var state = data.getState();
            console.log(state);
            
            if(data.getReturnValue() ==  true) {
                console.log('payment successfull');
            } else {
                console.log('payment unsuccessfull');
                
               
            }
        });
        console.log(action)
        $A.enqueueAction(action);
        
		
	}
})