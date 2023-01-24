import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/game_info.dart';
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
      withBackButton: true,
      child: Flexible(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GameInfo(game: game),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.network(game.videoPath)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
