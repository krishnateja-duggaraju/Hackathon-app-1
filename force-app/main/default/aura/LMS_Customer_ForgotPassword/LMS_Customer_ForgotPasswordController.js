({
 submitQuesAndAns : function(component, event, helper) {
       
        var securityQuestion = component.get('v.securityQuestion');
        var answer = component.get('v.answer');
        var email= component.get('v.email');   
        if($A.util.isEmpty(email) || $A.util.isUndefined(email)){
            alert('Please enter email address');
            return;
        }
        if($A.util.isEmpty(securityQuestion) || $A.util.isUndefined(securityQuestion)){
            alert('Please select Security Question');
            return;
        }
         else if($A.util.isEmpty(answer) ){
            alert('Please enter valid answer');
            return;
        }
          else {
                  helper.SubmitQuesAndAnsHelper(component, email,securityQuestion, answer);      
             }
    }

 

})