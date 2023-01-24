import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/scaffold_navigation.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});

  static const String route = '/game-info';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final game = ModalRoute.of(context)!.settings.arguments as Game;

    return ScaffoldNavigation(
      mainTitle: texts.websiteTitle,
      subTitle: game.title,
      child: const Text('coucou'),
    );
  }
}
