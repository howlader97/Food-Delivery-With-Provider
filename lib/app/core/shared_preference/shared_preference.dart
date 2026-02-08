import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {

  static Future<void> saveUserToken(String token)async{
    print("remon call");
  final SharedPreferences sharedPref=  await SharedPreferences.getInstance();
   await sharedPref.setString("user_token", token);
   print("remon all");
  print("token===== $token");
  print("remon chol");
  final ton =await getUserToken();
  print(ton);
  }

  static Future<dynamic> getUserToken()async{
    final SharedPreferences sharedPref=await SharedPreferences.getInstance();
    return sharedPref.getString("user_token");
  }
}