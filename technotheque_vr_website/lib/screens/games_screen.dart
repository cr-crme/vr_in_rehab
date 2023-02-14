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
    final screenSize = MediaQuery.of(context).size;

    final console = ModalRoute.of(context)!.settings.arguments as Console;

    const tileWidth = 200;
    final nbTiles = screenSize.width ~/ tileWidth;

    return FutureBuilder<List<Game>>(
        future: readGames(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final allGames = snapshot.data!;
          final games =
              allGames.where((game) => game.console == console.title).toList();

          return ScaffoldNavigation(
              mainTitle: texts.websiteTitle,
              subTitle: console.title,
              withBackButton: true,
              child: SizedBox(
                width: (nbTiles * tileWidth).toDouble(),
                height: screenSize.height - 100,
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
        });
  }
}
