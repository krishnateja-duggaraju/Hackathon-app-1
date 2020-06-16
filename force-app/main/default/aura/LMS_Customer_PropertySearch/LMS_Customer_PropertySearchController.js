({

    doInit: function(component, event, helper) {
        var action = component.get("c.getPiklistValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS"){
                var result = response.getReturnValue();
                var plValues = [];
                for (var i = 0; i < result.length; i++) {
                    plValues.push({
                        label: result[i],
                        value: result[i]
                    });
                }
                component.set("v.aminitiesList", plValues);
            }
        });
        $A.enqueueAction(action);
    },
     
    handleGenreChange: function (component, event, helper) {
        //Get the Selected values   
        var selectedValues = event.getParam("value");
         
        //Update the Selected Values  
        component.set("v.selectedaminitiesList", selectedValues);
    },
     
    getSelectedGenre : function(component, event, helper){
        //Get selected Genre List on button click 
        var selectedValues = component.get("v.selectedaminitiesList");
        console.log('Selectd aminitiesList-' + selectedValues);
    },
    
    handleFilter : function(component, event, helper) {
        var state = component.get('v.state');
        var country = component.get('v.country');
        var city = component.get('v.city');
        var detail = component.get('v.detail');
        var furnished = component.get('v.furnished');
        var gated_community = component.get('v.gated_community');
        var selectedaminitiesList = component.get('v.selectedaminitiesList');
        
        
        helper.getResults(component, state, country, city, detail, furnished, gated_community, selectedaminitiesList);
        
        
        
    },
    
    getAgent : function(component, event, helper) {
        var propId = event.target.id;
        console.log('Prop Id----'+propId);
        helper.getAgent(component, propId);
        

    }
    
    
    
     
    })