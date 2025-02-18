// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginUtils {
  static Future<bool> initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logIn(['email']);

    if (facebookLoginResult.status == FacebookLoginStatus.error) {
      print("Error");
      return false;
    } else if (facebookLoginResult.status ==
        FacebookLoginStatus.cancelledByUser) {
      print("Error");
      return false;
    } else if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      print("Error");
      return true;
    } else {
      return false;
    }
  }
}
