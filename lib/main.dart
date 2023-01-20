import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/theme.dart';
import '/providers.dart/locale_text.dart';
import '/screens/home_screen.dart';

void main() {
  runApp(const MyApp(defaultLanguage: 'fr'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.defaultLanguage});

  final String defaultLanguage;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => LocaleText(language: defaultLanguage)),
      ],
      child: MaterialApp(
        theme: myTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
