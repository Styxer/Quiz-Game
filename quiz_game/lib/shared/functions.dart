import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static final String userLoggedInKey = "UserLoggedInKey";

  static saveUserLoggedInDetails({@required bool isLoggedIn}) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(userLoggedInKey, isLoggedIn);
  }

  static Future<bool> getUserLoggedInDetails() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return  pref.getBool(userLoggedInKey);
  }

}