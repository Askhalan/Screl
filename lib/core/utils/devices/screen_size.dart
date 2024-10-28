
import 'package:flutter/material.dart';

class ScreenSize {
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 600 && width <= 1024;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}