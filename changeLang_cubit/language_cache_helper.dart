import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedLanguageCode = prefs.getString('lang');
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return 'ar';
    }
  }
}
