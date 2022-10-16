import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<Map> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? "") ?? {};
  }

  static Future setMap(String key, Map value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(value));
  }

  static Future clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
