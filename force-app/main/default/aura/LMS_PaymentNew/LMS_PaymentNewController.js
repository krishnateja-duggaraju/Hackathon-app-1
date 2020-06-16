({
    payCustomer : function(component, event, helper) {
        var action = component.get("c.lms_Customer_payDetails");
        
        var accountNumber = component.get("v.accountnumber"); 
        var Cvv= component.get("v.cvv");
        var expiryDate= component.get("v.expirydate");
        
        if($A.util.isEmpty(accountNumber) || $A.util.isUndefined(accountNumber)){
            alert('Please Enter User Name!');
            return;
        }   
         if($A.util.isEmpty(Cvv) || $A.util.isUndefined(Cvv)){
            alert('Please Enter Password!');
            return;
        } 
        if($A.util.isEmpty(expiryDate) || $A.util.isUndefined(expiryDate)){
            alert('Please Enter expirydate!');
            return;
        } 
          action.setParams({
              accountnumber:accountNumber,
              cvv:Cvv,
              expirydate:expiryDate              
        });
          action.setCallback(this,function(a){
              var rtnValue = a.getReturnValue();
              alert(rtnValue);
              
              
              console.log('The field list is :'+JSON.stringify(a.getReturnValue()));
          });
         $A.enqueueAction(action);
         component.set("v.accountnumber",'');
         component.set("v.cvv",'');
                component.set("v.expirydate",'');
    }
    
    
})