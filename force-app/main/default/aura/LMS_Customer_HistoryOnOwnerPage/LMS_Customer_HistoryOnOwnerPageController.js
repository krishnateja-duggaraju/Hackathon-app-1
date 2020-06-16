({
		
	doInit:function(component,event,helper){
        var ownerId = component.get('v.ownerId');
        console.log('ownerId '+ownerId);
        helper.SearchHistoryHelper(component,event, ownerId);
    }
})