({
	SubmitQuesAndAnsHelper : function(component,email, securityQuestion, answer) {
        var action = component.get("c.lms_Customer_ForgotPwd");
        action.setParams({email: email, securityQuestion : securityQuestion,
                          answer: answer});
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if(response.getReturnValue() == true) {
                alert('Your answer for the chosen security question is correct');
                var evt = $A.get("e.force:navigateToComponent");
                    evt.setParams({
                            componentDef : "c:Customer_ResetPassword"
        
                                   });
                      evt.fire();
                 
            } else {
                alert('Security Question or Answer is incorrect!');
            }
        });
        
        $A.enqueueAction(action);
    }
    
    

 
})