import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
      //for titles
      headline2: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 25, color: Colors.black54),
      headline3: TextStyle(
          color: Colors.black54, fontSize: 17, fontWeight: FontWeight.w400),
      headline4: TextStyle(
        fontSize: 18.0,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        color: Colors.black54,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      headline2: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
      headline3: TextStyle(
          color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w400),
      headline4: TextStyle(
        fontSize: 18.0,
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        color: Colors.white70,
      ),
    ),
  );
}
