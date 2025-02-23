import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { employees }

class Prefs {
  static Future<SharedPreferences> get _instance async {
    return _prefsInstance ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(PrefKeys key, [String defValue = '']) {
    return _prefsInstance?.getString(key.name) ?? defValue;
  }

  static Future<bool> setString(PrefKeys key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key.name, value);
  }
}
