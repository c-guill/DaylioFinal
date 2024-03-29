import 'package:daylio/utils/constants/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageData {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  // Theme settings
  void setThemeMode(ThemeModeSelection mode) async {
    SharedPreferences prefs = await preferences;
    prefs.setString("themeMode", mode.toString());
  }

  Future<ThemeModeSelection> getThemeModeSelection() async {
    SharedPreferences prefs = await preferences;
    String? modeString = prefs.getString("themeMode");
    return modeString != null ? ThemeModeSelection.values.firstWhere((e) => e.toString() == modeString) : ThemeModeSelection.system;
  }

  Future<ThemeMode> getThemeMode() async {
    SharedPreferences prefs = await preferences;
    String? modeString = prefs.getString("themeMode");
    return modeString != null
        ? _getThemeModeFromString(modeString)
        : ThemeMode.system;
  }

  ThemeMode _getThemeModeFromString(String modeString) {
    switch (modeString) {
      case 'ThemeModeSelection.light':
        return ThemeMode.light;
      case 'ThemeModeSelection.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // PIN code settings
  void setCodePin(String code) async {
    SharedPreferences prefs = await preferences;
    prefs.setString("pinCode", code);
  }

  Future<String> getCodePin() async {
    SharedPreferences prefs = await preferences;
    String? pc = prefs.getString("pinCode");
    return pc ?? "";
  }

  // User ID settings
  void setUID(User user) async {
    SharedPreferences prefs = await preferences;
    prefs.setString("uid", user.uid);
  }

  void removeUID() async{
    SharedPreferences prefs = await preferences;
    prefs.setString("uid", "");
  }

  Future<String> getUID() async{
    SharedPreferences prefs = await preferences;
    String? uid = prefs.getString("uid");
    return uid ?? "";
  }

}