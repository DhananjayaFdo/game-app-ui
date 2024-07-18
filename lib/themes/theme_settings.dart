import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeSettings {
  static const Color ash = Color(0xFFa5b1c5);
  static const Color black = Colors.black;

  static final ThemeData light = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: ash),
      titleTextStyle: TextStyle(color: ash, fontSize: 20),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: ash),
      bodyText2: TextStyle(color: ash),
    ),
    colorScheme: ColorScheme.light(
      primary: ash,
      secondary: Colors.blueAccent,
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: ash),
      titleTextStyle: TextStyle(color: ash, fontSize: 20),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white70),
    ),
    colorScheme: ColorScheme.dark(
      primary: ash,
      secondary: Colors.blueAccent,
    ),
  );
}
