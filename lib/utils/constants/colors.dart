import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static const Color primary = Color(0xFFB185DB);
  static const Color secondary = Color(0xFFC19EE0);
  static const Color accent = Color(0xFFb0c7ff);

  // Gradient colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xA3FFFFFF), Color(0xFF000000)],
  );

  // Text colors
  static Color textPrimary = const Color(0xFF000000).withOpacity(0.5);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;
  static const Color textBlack = Colors.black;
  static Color textDarkTheme = const Color(0xFFFFFFFF).withOpacity(0.8);
  static Color textLightTheme = const Color(0xFF000000).withOpacity(0.8);

  // Foreground colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Icon colors
  static Color iconPrimaryLight = Colors.black.withOpacity(0.5);
  static Color iconPrimaryDark = Colors.white.withOpacity(0.5);

  // Chart Graph colors
  static const Color chartRad = Color(0xFFF9B952);
  static const Color chartGood = Color(0xFFFFD664);
  static const Color chartMeh = Color(0xFF3AC770);
  static const Color chartBad = Color(0xFFD0E7F7);
  static const Color chartAwful = Color(0xFF7DBDFC);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6); // F3F3F3
  static Color darkContainer = TColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color(0xFF000000);
  static const Color buttonSecondary = Color(0xFFC19EE0);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF000000);
  static const Color softBlack = Color(0xFF101010);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF3F3F3);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}