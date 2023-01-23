import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/scaffold_navigation.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  static const String route = '/games';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final list = ModalRoute.of(context)!.settings.arguments as List;
    final console = list[0] as Console;
    final games = list[1] as List<Game>;

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: console.toString(),
        child: Text(games.toString()));
  }
}
