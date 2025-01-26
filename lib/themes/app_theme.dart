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

  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    iconTheme: IconThemeData(color: AppColor.primaryTextColor, size: 20),
    titleTextStyle: TextStyle(color: AppColor.primaryTextColor, fontSize: 18),
    scrolledUnderElevation: 0
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(AppColor.primaryAccentColor),
    checkColor: WidgetStateProperty.all(AppColor.primaryTextColor),
    shape: CircleBorder(side: BorderSide(color: AppColor.borderColor)),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColor.primaryAccentColor),
      iconColor: WidgetStateProperty.all(AppColor.primaryTextColor),
      side: WidgetStateProperty.all(BorderSide(color: AppColor.borderColor)),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
    )
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColor.secondaryColor,
    contentTextStyle: TextStyle(color: AppColor.primaryTextColor),
    insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColor.primaryAccentColor,
    linearTrackColor: AppColor.borderColor,
  ),
);
