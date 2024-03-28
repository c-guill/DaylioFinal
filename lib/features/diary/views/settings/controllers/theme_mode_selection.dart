import 'package:daylio/common/widgets/shared_preferences/manage_data.dart';
import 'package:daylio/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var selectedThemeMode = ThemeModeSelection.system.obs;
  final manageData = ManageData();

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  void _loadThemeMode() async {
    ThemeModeSelection savedThemeMode = await manageData.getThemeModeSelection();
    updateThemeMode(savedThemeMode);
  }

  void updateThemeMode(ThemeModeSelection mode) {
    selectedThemeMode.value = mode;
    _updateTheme(mode);
    manageData.setThemeMode(mode);
  }

  void _updateTheme(ThemeModeSelection mode) {
    switch (mode) {
      case ThemeModeSelection.light:
        Get.changeThemeMode(ThemeMode.light);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarIconBrightness: Brightness.dark,
        ));
        break;
      case ThemeModeSelection.dark:
        Get.changeThemeMode(ThemeMode.dark);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness: Brightness.light,
        ));
        break;
      case ThemeModeSelection.system:
        Get.changeThemeMode(ThemeMode.system);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ));
        break;
    }
  }
}