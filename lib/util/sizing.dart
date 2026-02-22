import 'package:flutter/material.dart';

class AppSizing {
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  static double pagePadding(BuildContext context) =>
      isTablet(context) ? 20 : 12;

  static double gap(BuildContext context) => isTablet(context) ? 14 : 10;

  static double headerFontSize(BuildContext context) =>
      isTablet(context) ? 24 : 20;

  static double amountFontSize(BuildContext context) =>
      isTablet(context) ? 28 : 22;

  static double rowFontSize(BuildContext context) =>
      isTablet(context) ? 20 : 16;

  static double keyFontSize(BuildContext context) =>
      isTablet(context) ? 20 : 18;

  static double keyHeight(BuildContext context) =>
      isTablet(context) ? 64 : 54;

  static double keyRadius(BuildContext context) =>
      isTablet(context) ? 10 : 8;
}
