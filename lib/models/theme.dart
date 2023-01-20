import 'package:flutter/material.dart';

ThemeData myTheme() {
  const textTitleSize = 36.0;
  const textSubtitleSize = 30.0;
  const textSize = 20.0;
  const textButtonSize = 20.0;

  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    fontFamily: 'Hind',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 106, 128, 146)),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge:
          TextStyle(fontSize: textTitleSize, fontStyle: FontStyle.italic),
      titleMedium:
          TextStyle(fontSize: textSubtitleSize, decoration: TextDecoration.underline),
      labelLarge: TextStyle(fontSize: textButtonSize),
      bodyMedium: TextStyle(fontSize: textSize),
    ),
  );
}
