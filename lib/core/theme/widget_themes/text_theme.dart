import 'package:flutter/material.dart';
import 'package:screl/core/constants/sizes.dart';

import '../../constants/colors.dart';




class JTextTheme {
  JTextTheme._(); 

  /// Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 20.0, fontWeight: FontWeight.bold, color: JColor.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.dark.withOpacity(0.5)),

    titleMedium: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: JColor.dark),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: JColor.dark),
   
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.dark),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.dark),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.dark.withOpacity(0.5)),
    
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: JColor.dark.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.normal, color: JColor.dark.withOpacity(0.5)),
    

  );

  ///  Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 22.0, fontWeight: FontWeight.bold, color: JColor.light),
    headlineSmall: const TextStyle().copyWith(fontSize: 20.0, fontWeight: FontWeight.w600, color: JColor.light.withOpacity(0.5)),

    titleMedium: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: JColor.light),
   
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.light),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.light),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.light.withOpacity(0.5)),

    labelSmall: const TextStyle().copyWith(fontSize: JSize.fontXsm, color: JColor.dark.withOpacity(0.8),fontWeight: FontWeight.w300),
    
   );
}
