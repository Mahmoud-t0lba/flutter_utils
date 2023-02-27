import 'package:shared_preferences/shared_preferences.dart';

final loginStatusKey = "login_status_key";
final firstLaunchKey = "first_launch_key";
final usernameKey = "username_key";
final userId = "user_id_key";
final passwordKey = "password_key";
final nameKey = "first_name_key";
final lastNameKey = "last_name_key";
final phoneNumberKey = "phone_number_key";
final avatarKey = "avatar_key";

class Preferences {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setLoginStatus(bool status) async =>
      sharedPreferences!.setBool(loginStatusKey, status);

  static Future<bool> isLoggedIn() async {
    var status = sharedPreferences!.getBool(loginStatusKey);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> setFirstLaunch(bool status) async =>
      sharedPreferences!.setBool(firstLaunchKey, status);

  static Future<bool> isFirstLaunch() async {
    var status = sharedPreferences!.getBool(firstLaunchKey);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> saveUserName(String userName) async =>
      sharedPreferences!.setString(nameKey, userName);

  static Future<String?> getUserName() async =>
      sharedPreferences!.getString(nameKey);

  static Future<bool> savePhoneNumber(String userName) async =>
      sharedPreferences!.setString(phoneNumberKey, userName);

  static Future<String?> getPhoneNumber() async =>
      sharedPreferences!.getString(phoneNumberKey);

  static Future<bool> saveAvatar(String userName) async =>
      sharedPreferences!.setString(avatarKey, userName);

  static Future<String?> getAvatar() async =>
      sharedPreferences!.getString(avatarKey);

  static Future<bool> savePassword(String password) async =>
      sharedPreferences!.setString(passwordKey, password);

  static Future<String?> getPassword() async =>
      sharedPreferences!.getString(passwordKey);

  static Future<bool> saveUserId(String userName) async =>
      sharedPreferences!.setString(userId, userName);

  static Future<String?> getUserId() async =>
      sharedPreferences!.getString(userId);

  static Future<bool> saveEmail(String email) async =>
      sharedPreferences!.setString(usernameKey, email);

  static Future<String?> getEmail() async =>
      sharedPreferences!.getString(usernameKey);

  static Future<bool> removeAllPreference() async {
    await sharedPreferences!.remove(usernameKey);
    await sharedPreferences!.remove(passwordKey);
    await sharedPreferences!.setBool(loginStatusKey, false);
    await sharedPreferences!.remove(avatarKey);
    return true;
  }

  static Future<bool> clearAllPreference() async =>
      await sharedPreferences!.clear();

  /// ============================================
  static Future<bool> putBoolean(
          {required String key, required bool value}) async =>
      await sharedPreferences!.setBool(key, value);

  static dynamic getData({String? key}) => sharedPreferences!.get(key!);

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);

    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({String? key}) async =>
      await sharedPreferences!.remove(key!);
}
