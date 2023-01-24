import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/game_thumbnail.dart';
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

    const tileWidth = 200;
    final nbTiles = MediaQuery.of(context).size.width ~/ tileWidth;

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: console.title(context),
        child: SizedBox(
          width: (nbTiles * tileWidth).toDouble(),
          height: 500,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: nbTiles,
            children: games
                .map<GameThumbnail>((game) => GameThumbnail(game: game))
                .toList(),
          ),
        ));
  }
}
