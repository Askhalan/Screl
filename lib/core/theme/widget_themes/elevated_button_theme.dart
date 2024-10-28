import 'package:flutter/material.dart';
import 'package:screl/core/constants/colors.dart';
import 'package:screl/core/constants/sizes.dart';



/* -- Light & Dark Elevated Button Themes -- */
class JElevatedButtonTheme {
  JElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: JColor.light,
    backgroundColor: JColor.primary,
    disabledForegroundColor: JColor.darkGrey,
    disabledBackgroundColor: JColor.buttonDisabled,
    side: const BorderSide(color: JColor.primary),
    padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight),
    textStyle: const TextStyle(fontSize: JSize.fontSm, color:  JColor.white, fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.buttonRadius)),
    minimumSize: const Size.fromHeight(50), 
    maximumSize: const Size(double.infinity, 50), 
  ).copyWith(
    // fixedSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 50)),
  ),
);

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: JColor.light,
      backgroundColor: JColor.primary,
      disabledForegroundColor: JColor.darkGrey,
      disabledBackgroundColor: JColor.darkerGrey,
      side: const BorderSide(color: JColor.primary),
      padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight,),
      textStyle: const TextStyle(fontSize: 16, color: JColor.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.inputFieldRadiusXl)),
      minimumSize: const Size.fromHeight(50), 
    maximumSize: const Size(double.infinity, 50),
  ).copyWith(
    // fixedSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 50)),
  ),
  );
}
