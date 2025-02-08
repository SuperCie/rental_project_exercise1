import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade200,
      primary: Colors.teal.shade300,
      secondary: Colors.white,
      tertiary: Colors.black,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        primary: Colors.teal.shade500,
        secondary: Colors.grey.shade700,
        tertiary: Colors.white));
