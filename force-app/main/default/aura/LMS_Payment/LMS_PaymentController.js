({
	payCustomer : function(component, event, helper) {
		var accountnumber = component.get('v.accountnumber');
        var cvv = component.get('v.cvv');
        var expiry_month = component.get('v.expiry_month');
        var expiry_year = component.get('v.expiry_year');
        
        console.log(accountnumber);
        console.log(cvv);
       
        if($A.util.isEmpty(accountnumber) ){
            alert('Please enter valid accountnumber');
            return;
        }  
         else if($A.util.isEmpty(cvv) ){
            alert('Please enter valid cvv');
            return;
        }
        
        else if($A.util.isEmpty(expiry_year) ){
            alert('Please enter valid expiry year');
            return;
        } else if($A.util.isEmpty(expiry_month) ){
            alert('Please enter valid expiry month');
            return;
        }
        
        
        
          else {
          		helper.customerPay(component, accountnumber, cvv,expiry_month , expiry_year ); 
                
             }
	},
    
    navToTransaction : function(component, event, helper) {
        console.log(component.get("v.negoAmount"));
        console.log(component.get("v.payy"));
        var evt = $A.get("e.force:navigateToComponent");
				//console.log('evt'+evt);
				evt.setParams({
				componentDef: "c:LMS_Transaction",
                    componentAttributes :
                    {
                    amount : component.get("v.negoAmount"),
                    acc : component.get("v.payy")
                   	
                	}
 
			});
			evt.fire();
        
    }
    
    
    
     
    })