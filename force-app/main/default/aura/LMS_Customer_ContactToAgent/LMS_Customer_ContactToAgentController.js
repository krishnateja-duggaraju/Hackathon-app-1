({
		
	doInit:function(component,event,helper){
        var agentId = component.get('v.agentId');
        console.log('agent '+agentId);
        helper.SearchAgentHelper(component,event, agentId);
    }
})