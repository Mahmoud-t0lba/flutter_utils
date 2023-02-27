import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final loginStatusKey = "loginStatusKey";
  static final userId = "user_id_key";

  static Future<bool> setLoginStatus(bool status) async {
    ////used in login screen after successful login.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(loginStatusKey, status);
  }

  static Future<bool> isLoggedIn() async {
    ////used in main.dart file for checking auto-login
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(loginStatusKey);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> saveUserId(String userName) async {
    //used in login screen after successful login
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userId, userName);
  }

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId);
  }

  static Future<bool> clearPreference(passwordUserIdKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(passwordUserIdKey);
    prefs.setBool(loginStatusKey, false);
    return true;
  }
}
