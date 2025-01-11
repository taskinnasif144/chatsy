import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Color(0xff2c64f3),
    secondary:  Color(0xff18388b),
    tertiary: Color(0xff434e71)
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),

);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Color(0xFF262f40),
        primary: Color(0xFF161d2d),
        secondary:  Color(0xff18388b),
        tertiary: Color(0xff434e71)
    )
);