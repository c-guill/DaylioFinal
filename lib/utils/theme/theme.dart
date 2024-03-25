import 'package:daylio/utils/constants/colors.dart';
import 'package:daylio/utils/theme/widget_themes/appbar_theme.dart';
import 'package:daylio/utils/theme/widget_themes/navigation_bar_theme.dart';
import 'package:daylio/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:daylio/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:daylio/utils/theme/widget_themes/chip_theme.dart';
import 'package:daylio/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:daylio/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:daylio/utils/theme/widget_themes/text_field_theme.dart';
import 'package:daylio/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.softGrey,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    navigationBarTheme: TNavBarTheme.lightNavBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.softBlack,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    navigationBarTheme: TNavBarTheme.darkNavBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}