import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_color.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColor.primaryColor,
  scaffoldBackgroundColor: AppColor.primaryColor,
  dialogBackgroundColor: AppColor.secondaryColor,
  disabledColor: AppColor.disabledColor,
  dividerColor: AppColor.dividerColor,
  hintColor: AppColor.secondaryTextColor,

  textTheme: TextTheme(
    displayLarge: TextStyle(color: AppColor.primaryTextColor),
    displayMedium: TextStyle(color: AppColor.primaryTextColor),
    displaySmall: TextStyle(color: AppColor.primaryTextColor),
    headlineLarge: TextStyle(color: AppColor.primaryTextColor),
    headlineMedium: TextStyle(color: AppColor.primaryTextColor),
    headlineSmall: TextStyle(color: AppColor.primaryTextColor),
    titleLarge: TextStyle(color: AppColor.primaryTextColor),
    titleMedium: TextStyle(color: AppColor.primaryTextColor),
    titleSmall: TextStyle(color: AppColor.primaryTextColor),
    bodyLarge: TextStyle(color: AppColor.primaryTextColor),
    bodyMedium: TextStyle(color: AppColor.primaryTextColor),
    bodySmall: TextStyle(color: AppColor.primaryTextColor),
    labelLarge: TextStyle(color: AppColor.primaryTextColor),
    labelMedium: TextStyle(color: AppColor.primaryTextColor),
    labelSmall: TextStyle(color: AppColor.primaryTextColor),
  ),
);
