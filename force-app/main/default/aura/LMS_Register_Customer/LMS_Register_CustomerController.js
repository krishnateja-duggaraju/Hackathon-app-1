({
     registerUser: function(component, event, helper) {
        var validUser = component.find('userform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        var pwd = component.get('v.user.LMS_Password__c');
        var cpwd = component.get('v.confirm_password');
        
        if(pwd!=cpwd) {
            console.log();
            component.set('v.err', true);
            return;
        }
        
        if(validUser){
            // Create the new user
            var newUser = component.get("v.user");
            console.log("Create User: " + JSON.stringify(newUser));
            helper.createUser(component, newUser);
        }
    
    },
    doInit : function(component, event, helper) {
        var pVals = [
            {text:"India", value: "India"},
            {text:"USA", value: "USA"},
            {text:"Australia", value: "Australia"}
        ];
 
        var dPick = {
            "India" : [
                {text:"Telangana", value: "Telangana"},
                {text:"Chennai", value: "Chennai"}
            ],
            "USA" : [
                {text:"San Francisco", value: "San Francisco"},
                {text:"Chicago", value: "Chicago"}
            ],
            "Australia" : [
                {text:"Sydney", value: "Sydney"},
                {text:"Melbourne", value: "Melbourne"}
            ]
        };
         var dcPick = {
            "Telangana" : [
               
                {text:"Adilabad", value: "Adilabad"},
                {text:"Hyderabad", value: "Hyderabad"}
            
            ],
            "Chicago":[
                 {text:"EngleWood", value: "EngleWood"}
              
 

            ],
             
             "Melbourne":[
                 {text:"Victoria", value: "Victoria"}

                 ]
        };
 
        component.set('v.parentOptions', pVals);
        component.set('v.dependentPicklist', dPick);
        component.set('v.dependentCityPicklist', dcPick);

 

    },
 
    PickChange : function(component, event, helper) {
        var parentValue = component.find('parentPicklist').get('v.value');
        component.set('v.dependentOptions', component.get('v.dependentPicklist')[parentValue]);
 
        if(parentValue != '')
        component.set('v.disabledPick',false);
        else
        component.set('v.disabledPick',true);
    },
    PickCityChange : function(component, event, helper) {
        var depValue = component.find('depPicklist').get('v.value');
        component.set('v.dependentCityOptions', component.get('v.dependentCityPicklist')[depValue]);
 
        if(depValue != '')
        component.set('v.disabledCityPick',false);
        else
        component.set('v.disabledCityPick',true);
    }
   
   
   
})