import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/theme.dart';
import '/screens/consoles_screen.dart';
import '/screens/game_info_screen.dart';
import '/screens/games_screen.dart';
import '/screens/generality_screen.dart';
import '/screens/navigating_screen.dart';
import '/screens/home_screen.dart';
import '/screens/resources_screen.dart';

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
        theme: websiteTheme,
        initialRoute: HomeScreen.route,
        routes: {
          HomeScreen.route: (ctx) => const HomeScreen(),
          GeneralityScreen.route: (ctx) => const GeneralityScreen(),
          ConsolesScreen.route: (ctx) => const ConsolesScreen(),
          NavigatingScreen.route: (ctx) => const NavigatingScreen(),
          GamesScreen.route: (ctx) => const GamesScreen(),
          GameInfoScreen.route: (ctx) => const GameInfoScreen(),
          ResourcesScreen.route: (ctx) => const ResourcesScreen(),
        },
      ),
    );
  }
}
