({
    registerUser: function(component, event, helper) {
        var validUser = component.find('userform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validUser){
            // Create the new user
            var newUser = component.get("v.user");
            console.log("Create User: " + JSON.stringify(newUser));
            helper.createUser(component, newUser);
        }
    }
})