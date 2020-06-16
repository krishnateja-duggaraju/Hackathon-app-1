({
	getResults : function(component, state, country, city, detail, furnished, gated_community, selectedaminitiesList) {
		 var action = component.get("c.getDetails");
        action.setParams({ state: state,
                          country:country,
                          city:city,
                          detail:detail,
                          furnished: furnished,
                          gated_community:gated_community,
                          selectedaminitiesList:selectedaminitiesList, });
        action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
            if(data.getReturnValue()!=null)
              {
                 component.set('v.showProperties', true);
                  component.set('v.err', false);
                  console.log('prop'+component.get('v.showProperties'));
                  console.log('err'+component.get('v.err'));
                  component.set('v.properties', data.getReturnValue())
                  console.log( component.get('v.properties'));
                  
               
           } else {
                component.set('v.err', true);
               component.set('v.showProperties', false);
            }
        });
        $A.enqueueAction(action);
	},
    
    getAgent : function(component, propId) {
        console.log('helper method of getAgent');
        var custId = component.get('v.customerId');
        var action = component.get("c.getAgentDetails");
        action.setParams({ propId: propId,
                          custId : custId});
        action.setCallback(this, function(data) {
            console.log('returned ----- '+data.getReturnValue());
            if(data.getReturnValue()!=null)
              {
                 component.set('v.agent',data.getReturnValue() )
                  console.log('got ----- '+component.get('v.agent'));
                  
              var evt = $A.get("e.force:navigateToComponent");
    	            evt.setParams({
                            componentDef : "c:LMS_Customer_ContactToAgent",
        					componentAttributes: {
            					agentId : component.get("v.agent.Id")
                                
        					}
                        
        
                                   });
                      evt.fire();
           } else {
                alert('error getting agent details');
            }
        });
        $A.enqueueAction(action);
    }
})