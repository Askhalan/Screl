import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class JAppTheme {
  JAppTheme._();

// +++++++---------------------------- LIGHT THEME ----------------------------+++++++

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: JColor.grey,
    brightness: Brightness.light,
    primaryColor: JColor.primary,
    textTheme: JTextTheme.lightTextTheme,
    scaffoldBackgroundColor: JColor.white,
    elevatedButtonTheme: JElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.lightInputDecorationTheme,
  );

// +++++++----------------------------- DARK THEME -----------------------------+++++++

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: JColor.grey,
    brightness: Brightness.dark,
    primaryColor: JColor.primary,
    textTheme: JTextTheme.darkTextTheme,
    scaffoldBackgroundColor: JColor.secondary,
    elevatedButtonTheme: JElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.darkInputDecorationTheme,
  );
}
