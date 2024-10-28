import 'package:flutter/material.dart';
import 'package:screl/core/constants/colors.dart';

class JSwitchTheme {
  JSwitchTheme._();

  /* -- Light Theme -- */
  static const lightSwitchTheme = SwitchThemeData(
    trackColor: WidgetStatePropertyAll(JColor.primary),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
   
    splashRadius: 20.0,
  );

  /* -- Dark Theme -- */
  static const darkSwitchTheme = SwitchThemeData(
    trackColor: WidgetStatePropertyAll(JColor.primary),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashRadius: 20.0,
  );
}
