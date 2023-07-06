import 'package:shared_preferences/shared_preferences.dart';



class HelperFunctions{
  /////keys

  static String  userLoggedInKey='LOGGEDINKEY';
  static String userNameKey='USERNAMEKEY';
  static String userEmailKey='USEREMAILKEY';


  ////saving  the data to sf
static Future<bool> saveUserLoggedInStatUs(bool isUserLoggedIn)async{

  SharedPreferences sf=await SharedPreferences.getInstance();

  return await sf.setBool(userLoggedInKey, isUserLoggedIn);
}

  static Future<bool> saveUserName(String userName)async{

    SharedPreferences sf=await SharedPreferences.getInstance();

    return await sf.setString(userNameKey, userName);
  }
  static Future<bool> saveUserEmail(String  userEmail)async{

    SharedPreferences sf=await SharedPreferences.getInstance();

    return await sf.setString(userEmailKey, userEmail);
  }




  /////getting the data from sf

  static Future<bool?> getUserLoggedInStateUs()async{

    SharedPreferences sf=await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);



  }


}

