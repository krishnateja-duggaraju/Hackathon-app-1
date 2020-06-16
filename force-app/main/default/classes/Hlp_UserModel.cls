global class Hlp_UserModel {
     @AuraEnabled public String changePasswordmessage;
     @AuraEnabled
        public static string changePassword(String newPassword, String verifyNewPassword, String oldPassword) { 
        try{
                PageReference pr = Site.changePassword(newPassword, verifyNewPassword, oldpassword);
                if (pr != null) {
                    return 'SUCCESS';
                } else {
                    return null;
                }
        } catch (Exception ex) {
            //changePasswordmessage = ex.getMessage();
            System.debug(ex.getMessage());
           // System.debug('subrat'+changePasswordmessage);
            return null;
        }
     }
}