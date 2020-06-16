({
    doInit : function(component, event, helper) {
        var pVals = [
            {text:"Australia",value:"Australia"},
            {text:"Canada",value:"Canada"},
            {text:"India", value: "India"},
            {text:"USA", value: "USA"}
           
        ];
 
        var dPick = {
            "India" : [
                {text:"Andhra Pradesh", value: "Andhra Pradesh"},
                {text:"Maharashtra", value: "Maharashtra"},
                {text:"Punjab", value:"Punjab"},
                {text:"Telangana", value: "Telangana"}               
            ],
            "USA" : [
                {text:"Calfornia", value: "Calfornia"},
                {text:"New Jersey", value: "New Jersey"},
                {text:"Texas", value: "Texas"}
            ],
            "Australia" : [
                {text:"New South Wales", value: "New South Wales"},
                {text:"Queensland", value: "Queensland"},
               	{text:"Victoria", value: "Victoria"} 
            ],
            "Canada" : [
                {text:"Alberta", value: "Alberta"},
                {text:"Manitoba", value: "Manitoba"},
               	{text:"Ontario", value: "Ontario"} 
            ]
        };
          
        var dcPick = {
            "Telangana" : [
                 {text:"Hyderabad", value: "Hyderabad"},
		 {text:"Karimnagar", value: "Karimnagar"},
                 {text:"Warangal",value:"Warangal"}         
            
            ],
            "Andhra Pradesh":[
                {text:"Amaravathi", value: "Amaravathi"},
                {text:"Tirupathi", value: "Tirupathi"},
 		{text:"Vijayawada", value: "Vijayawada"},
                {text:"Vizag", value: "Vizag"}
            ],
            "Punjab" : [
                 {text:"Amritsar", value: "Amritsar"},
		 {text:"Chandigarh", value: "Chandigarh"},
                 {text:"Jalandhar",value:"Jalandhar"}         
            ],
            "Maharashtra":[
                {text:"Mumbai", value: "Mumbai"},
                {text:"Nashik", value: "Nashik"},
 		{text:"Pune", value: "Pune"}
	    ],
            "Texas":[
                {text:"Dallas", value: "Dallas"},
                {text:"Houston", value: "Houston"}
	   ],
            "California":[
                {text:"Los Angeles", value: "Los Angeles"},
                {text:"San Francisco", value: "San Francisco"}
           ],
            "New Jersey":[
                {text:"Atlantic city", value: "Atlantic city"},
                {text:"Jersey city", value: "Jersey city"},
 		{text:"Trenton", value: "Trenton"}
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
    },
    clickCreate: function(component, event, helper) {
        var validAgent = component.find('agentForm').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validAgent){
            // Create the new expense
            var newAgent = component.get("v.agent");
            console.log("Create agent: " + JSON.stringify(newAgent));
            helper.createUser(component, newAgent);
            component.set("v.agent",'');
            }
    }
})