@isTest
public class LMS_OwnerLoginControllerTest {

@isTest public static void LMS_LoginOwner_TestMethod() {
        String email = 'email', password='password';
       
        System.assertEquals(false,LMS_OwnerController.lms_Login_Owner(email,password));
       
    }
}