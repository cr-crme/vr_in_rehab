import 'package:flutter/material.dart';

const Color _backgroundColor = Color.fromARGB(255, 5, 94, 154);
const Color _primaryColor = Color.fromARGB(255, 114, 184, 212);

ThemeData get decideVrTheme {
  return ThemeData(
    fontFamily: "Lato",
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: _primaryColor,
      onPrimary: Colors.black,
      secondary: Color.fromARGB(255, 73, 163, 223),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.black,
      background: _backgroundColor,
      onBackground: Colors.white,
      surface: _backgroundColor,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 73, 163, 223),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
    ),
  );
}
