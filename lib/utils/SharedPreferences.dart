import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final loginStatusKey = "login_status_key";
  static final firstLaunchKey = "first_launch_key";
  static final usernameKey = "username_key";
  static final userId = "user_id_key";
  static final passwordKey = "password_key";
  static final firstNameKey = "first_name_key";
  static final lastNameKey = "last_name_key";
  static final phoneNumberKey = "phone_number_key";
  static final avatarKey = "avatar_key";

  static Future<bool> setLoginStatus(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(loginStatusKey, status);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(loginStatusKey);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> setFirstLaunch(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(firstLaunchKey, status);
  }

  static Future<bool> isFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(firstLaunchKey);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> saveFirstName(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(firstNameKey, userName);
  }

  static Future<String?> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(firstNameKey);
  }

  static Future<bool> saveLastName(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(lastNameKey, userName);
  }

  static Future<String?> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastNameKey);
  }

  static Future<bool> savePhoneNumber(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(phoneNumberKey, userName);
  }

  static Future<String?> getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(phoneNumberKey);
  }

  static Future<bool> saveAvatar(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(avatarKey, userName);
  }

  static Future<String?> getAvatar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(avatarKey);
  }

  static Future<bool> savePassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(passwordKey, password);
  }

  static Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(passwordKey);
  }

  static Future<bool> saveUserId(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userId, userName);
  }

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId);
  }

  static Future<bool> saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(usernameKey, email);
  }

  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }

  static Future<bool> clearPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(usernameKey);
    prefs.remove(passwordKey);
    prefs.setBool(loginStatusKey, false);
    prefs.remove(avatarKey);
    return true;
  }
}
