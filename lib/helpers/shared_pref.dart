import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String kLoggedInKey = 'isLoggedIn';
  static const String kUsernameKey = 'username';

  static Future<bool> get isLoggedIn async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kLoggedInKey) ?? false;
  }

  static Future<String?> get username async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kUsernameKey);
  }

  static Future<void> setLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kLoggedInKey, isLoggedIn);
  }

  static Future<void> setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kUsernameKey, username);
  }

  static Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(kUsernameKey) ?? '';
}

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
