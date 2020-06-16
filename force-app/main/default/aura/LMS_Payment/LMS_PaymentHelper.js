({
	customerPay : function(component, accountnumber, cvv, expiry_month , expiry_year) {
		var action = component.get("c.verifyCard");
        
        
        action.setParams({  accountnumber: accountnumber,
                          cvv: cvv,
                          expiry_month: expiry_month,
                          expiry_year : expiry_year,
                          amount : component.get('v.negoAmount'),
                          customerId: component.get('v.customerId'),
                          PropertyName : component.get('v.PropertyName')
                         });
        
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            
            if(response.getReturnValue() !=  null) {
                
                 
                
                component.set('v.payy', response.getReturnValue() );
               
                console.log(component.get('v.payy'));
                    component.set('v.result',true);	
                component.set('v.error',false);
            } else {
                
                component.set('v.result', false);
            component.set('v.error',true);
               
            }
        });
        $A.enqueueAction(action);
	},
    
    
    
    

})