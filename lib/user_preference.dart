import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _firstTimeUser = "firstTimeUser";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static clearPreferences() async {
    await _preferences!.clear();
  }

  static Future setFirstTimeUser() async {
    await _preferences!.setBool(_firstTimeUser, true);
  }

  static Future<bool?> getFirstTimeUser() async {
    _preferences!.getBool(_firstTimeUser);
    return null;
  }
}
