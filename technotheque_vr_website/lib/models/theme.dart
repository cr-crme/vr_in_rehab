import 'package:flutter/material.dart';

const Color _backgroundColor = Color.fromARGB(255, 5, 94, 154);
const Color _primaryColor = Color.fromARGB(255, 114, 184, 212);
const Color _secondaryColor = Color.fromARGB(255, 73, 163, 223);

ThemeData get websiteTheme {
  return ThemeData(
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
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
      titleSmall:
          TextStyle(decoration: TextDecoration.underline, color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _secondaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
    ),
  );
}
