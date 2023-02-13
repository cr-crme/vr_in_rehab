import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/theme.dart';
import '/screens/consoles_screen.dart';
import '/screens/forum_screen.dart';
import '/screens/game_info_screen.dart';
import '/screens/games_screen.dart';
import '/screens/generality_screen.dart';
import '/screens/home_screen.dart';
import '/screens/ressources_screen.dart';

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
          GamesScreen.route: (ctx) => const GamesScreen(),
          GameInfoScreen.route: (ctx) => const GameInfoScreen(),
          ForumScreen.route: (ctx) => const ForumScreen(),
          RessourcesScreen.route: (ctx) => const RessourcesScreen(),
        },
      ),
    );
  }
}
