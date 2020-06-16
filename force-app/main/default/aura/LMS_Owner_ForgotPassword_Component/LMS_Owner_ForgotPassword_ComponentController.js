({
	getOwner : function(component, event, helper) {
        
        var email = component.get('v.email');
        
        if(email != null) {
            helper.getOwner(component, email);
        }
		
	},
    
    checkSecurityQuestion : function(component, event, helper) {
        var email = component.get('v.email');
        var answer = component.get('v.answer');
        var actualAnswer = component.get('v.owner.LMS_OwnerAnswer__c');
        
        if (answer == actualAnswer) {
            component.set('v.reset', true);
            component.set('v.error', false);
        } else {
            component.set('v.reset', false);
            component.set('v.error', true);
            return;
        }
    },
    
    resetPassword : function(component, event, helper) {
        var pwd = component.get('v.newPassword');
        var cpwd = component.get('v.confirmNewPassword');
        
        if(pwd!=cpwd) {
            component.set('v.cerror', true);
            return;
        } else {
            var owner = component.get('v.owner');
            component.set('v.cerror', false);
            console.log(pwd);
            helper.resetPassword(component, owner, pwd);
        }
    }
})