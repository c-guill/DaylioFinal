import 'package:flutter/material.dart';
import 'package:daylio/utils/constants/colors.dart';

class TNavBarTheme {
  TNavBarTheme._();

  static NavigationBarThemeData lightNavBarTheme = NavigationBarThemeData(
    // create labelTextStyle of this NavigationBarThemeData
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      return TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: TColors.black.withOpacity(0.5),
        letterSpacing: 1.0,
      );
    }),
  );

  static NavigationBarThemeData darkNavBarTheme = NavigationBarThemeData(
    // create labelTextStyle of this NavigationBarThemeData
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      return TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: TColors.white.withOpacity(0.5),
        letterSpacing: 1.0,
      );
    }),
  );


}