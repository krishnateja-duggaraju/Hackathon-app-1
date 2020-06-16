({
    registerOwner: function(component, event, helper) {
        var validOwner = component.find('ownerform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validOwner){
            // Create the new user
            var newOwner = component.get("v.owner");
            console.log("Create Owner: " + JSON.stringify(newOwner));
            helper.createOwner(component, newOwner);
            component.set("v.owner",'');
           
        }
    },
   
    checkValidity : function(component, event, helper) {
        var validity = event.getSource().get("v.validity");
        console.log(validity)
    },
    checkConfirmPassword : function(component,event,helper){
       
        
        var input=component.find("ownerformpwd");
        var input2=component.find("ownerformcpwd");
        var pwd=input.get("v.value");
        var cpwd=input2.get("v.value");
        if(pwd!=cpwd){
            input2.setCustomValidity("Confirm password must match with password");
            //input2.set("v.errors", [{message: invalid}]);
        }
        else{
            input2.setCustomValidity("");
            //input2.set("v.errors", [{message: null}]);
        }
    },
    toggle: function (component, event, helper) {

         var sel = component.find("ownerformcountry");
         var nav =	sel.get("v.value");	
         if (nav == "India") {  
              component.set("v.toggleInd", true);
         }


	 else if(nav == "America"){

            component.set("v.toggleInd", false);

            component.set("v.toggleUS", true);

         }
        else if(nav == "Australia"){

            component.set("v.toggleInd", false);
             component.set("v.toggleUS", false);

            component.set("v.toggleAus", true);

         }
        else if(nav == "Germany"){

            component.set("v.toggleInd", false);
             component.set("v.toggleUS", false);
            component.set("v.toggleAus", false);
            component.set("v.toggleGer", true);

         }
        else if(nav == "Canada"){

            component.set("v.toggleInd", false);
             component.set("v.toggleUS", false);
            component.set("v.toggleAus", false);
            component.set("v.toggleGer", false);
            component.set("v.toggleCanada", true);

         }
            else{
                component.set("v.toggleInd",true);
            }

    },
toggleIndCities: function (component, event, helper) {

         var state = component.find("ownerformstate");
         var getCities =	state.get("v.value");
         if (getCities == "Andhra Pradesh") { 
              component.set("v.toggleAndhra", true);
         }
	 else if(getCities == "Telangana"){
            component.set("v.toggleAndhra", false);
            component.set("v.toggleTelangana", true);

         }
        else if(getCities == "Tamil Nadu"){

            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", true);

         }
        else if(getCities == "Kerala"){

            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", true);

         }
        else if(getCities == "Uttar Pradesh"){

            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", true);

         }
            
},
     toggleUsCities: function (component, event, helper) {

         var usstate = component.find("ownerformus");
         var getUsCities =	usstate.get("v.value");
         if (getUsCities == "New Jersey") {  
             component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
              component.set("v.toggleNewJersey", true);
         }


	 else if(getUsCities == "Virginia"){
         component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);

            component.set("v.toggleNewJersey", false);

            component.set("v.toggleVirginia", true);

         }
        else if(getUsCities == "Connecticut"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);

            component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);

            component.set("v.toggleConnecticut", true);

         }
        else if(getUsCities == "Wyoming"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);

            component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", true);

         }

    },
    
    toggleAusCities: function (component, event, helper) {

         var ausstate = component.find("ownerformaus");
         var getausCities =	ausstate.get("v.value");
         if (getausCities == "New South Wales") {  
             component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
             
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
             
              component.set("v.toggleNewSouthWales", true);
         }


	 else if(getausCities == "Queensland"){
         component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);

             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
         
         	component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", true);

         }
        else if(getausCities == "Tasmania"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
            
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);

            component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", true);

         }
        else if(getausCities == "Victoria"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
            
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);

            component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", true);

         }
        
            else if(getausCities == "South Australia"){
                component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
                
                 component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
                
			component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", true);

            }

    },
    
    toggleGerCities: function (component, event, helper) {

         var gerstate = component.find("ownerformger");
         var getGerCities =	gerstate.get("v.value");
         if (getGerCities == "Bavaria") {  
             component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
             
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
             
             component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
             
              component.set("v.toggleBavaria", true);
         }


	 else if(getGerCities == "Berlin"){
         component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);

             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
         	
         	component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
         	
         	component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", true);

         }
        else if(getGerCities == "Lower Saxony"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
            
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
            
            component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);

            component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", true);

         }
        else if(getGerCities == "Saarland"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
            
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
            
            component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);

            component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", true);

         }
        
            else if(getGerCities == "Thuringia"){
                component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
                
                 component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
                
                component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
                
			component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", false);
             component.set("v.toggleThuringia", true);

            }

    },
     toggleCanadaCities: function (component, event, helper) {

         var canstate = component.find("ownerformcanada");
         var getCanCities =	canstate.get("v.value");
         if (getCanCities == "Alberta") {  
             component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
             
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
             
             component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
             
             component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", false);
             component.set("v.toggleThuringia", false);
             
              component.set("v.toggleAlberta", true);
         }


	 else if(getCanCities == "British Columbia"){
         component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);

             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
         	
         	component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
         
         component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", false);
             component.set("v.toggleThuringia", false);
         	
         	component.set("v.toggleAlberta", false);
            component.set("v.toggleBritishColumbia", true);

         }
        else if(getCanCities == "Manitoba"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
            
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
            
            component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
            
            component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", false);
             component.set("v.toggleThuringia", false);

            component.set("v.toggleAlberta", false);
            component.set("v.toggleBritishColumbia", false);
            component.set("v.toggleManitoba", true);

         }
        else if(getCanCities == "New Brunswick"){
            component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
            
             component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
            
            component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
            
            component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", false);
             component.set("v.toggleThuringia", false);

            component.set("v.toggleAlberta", false);
            component.set("v.toggleBritishColumbia", false);
            component.set("v.toggleManitoba", false);
            component.set("v.toggleNewBrunswick", true);

         }
        
            else if(getCanCities == "Nunavut"){
                component.set("v.toggleIAndhra", false);
             component.set("v.toggleTelangana", false);
            component.set("v.toggleTamil", false);
            component.set("v.toggleKerala", false);
            component.set("v.toggleUttarPradesh", false);
                
                 component.set("v.toggleNewJersey", false);
             component.set("v.toggleVirginia", false);
            component.set("v.toggleConnecticut", false);
            component.set("v.toggleWhyoming", false);
                
                component.set("v.toggleNewSouthWales", false);
            component.set("v.toggleQueensland", false);
            component.set("v.toggleTasmania", false);
            component.set("v.toggleVictoria", false);
             component.set("v.toggleSouthAustralia", false);
                
                component.set("v.toggleBavaria", false);
            component.set("v.toggleBerlin", false);
            component.set("v.toggleLowerSaxony", false);
            component.set("v.toggleSaarland", false);
             component.set("v.toggleThuringia", false);
                
			component.set("v.toggleAlberta", false);
            component.set("v.toggleBritishColumbia", false);
            component.set("v.toggleManitoba", false);
            component.set("v.toggleNewBrunswick", false);
             component.set("v.toggleNunavut", true);

            }

    }
    

})