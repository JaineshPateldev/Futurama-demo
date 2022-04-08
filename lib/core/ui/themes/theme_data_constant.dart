import 'package:flutter/material.dart';

import '../../core_export.dart';

class ThemeDataConstant {

 static ThemeData light = ThemeData(
    buttonTheme: const ButtonThemeData(
      buttonColor: blueColor,
      textTheme: ButtonTextTheme.primary,
    ),
    scaffoldBackgroundColor: blueColor, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.pink ,brightness: Brightness.light));

static ThemeData dark = ThemeData(
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Colors.pink, brightness: Brightness.dark),
);


}