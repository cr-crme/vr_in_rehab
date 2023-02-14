import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/misc/theme.dart';
import '/common/providers/decision_algorithm.dart';
import '/screens/fill_info_screen.dart';
import '/screens/result_game_details_screen.dart';
import '/screens/results_summary_screen.dart';
import '/screens/welcome_screen.dart';

void main() {
  // We set the default language to french, but this can be set later
  runApp(const MyApp(defaultLanguage: 'fr'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.defaultLanguage});

  final String defaultLanguage;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DecisionAlgorithm()),
        ChangeNotifierProvider(
            create: (context) => LocaleText(language: defaultLanguage)),
      ],
      child: MaterialApp(
        theme: decideVrTheme,
        initialRoute: WelcomeScreen.route,
        onGenerateRoute: (settings) {
          if (settings.name == FillingInfoScreen.route) {
            return MaterialPageRoute(
                builder: (ctx) => const FillingInfoScreen());
          } else if (settings.name == ResultsSummaryScreen.route) {
            return MaterialPageRoute(
                builder: (ctx) => const ResultsSummaryScreen());
          } else if (settings.name == ResultGameDetailsScreen.route) {
            return MaterialPageRoute(
                builder: (ctx) =>
                    ResultGameDetailsScreen(game: settings.arguments as Game));
          } else {
            return MaterialPageRoute(builder: (ctx) => const WelcomeScreen());
          }
        },
      ),
    );
  }
}
