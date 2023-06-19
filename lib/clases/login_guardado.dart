import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginGuardado {
  static const String _KEY_LAST_LOGIN_DATE = 'last_login_date';

  //Guarda la fecha de ahora
  static Future<void> saveLastLogin() async {
    final timeNow = DateTime.now();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(_KEY_LAST_LOGIN_DATE, timeNow.millisecondsSinceEpoch);
  }
  //Guarda la fecha del últimmo login
  static Future<DateTime?> getLastLogin() async {
    final preferences = await SharedPreferences.getInstance();
    final lastLogin = preferences.getInt(_KEY_LAST_LOGIN_DATE);
    if (lastLogin == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(lastLogin);
  }
}