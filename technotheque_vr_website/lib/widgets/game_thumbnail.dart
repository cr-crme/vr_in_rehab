import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/screens/game_info_screen.dart';

class GameThumbnail extends StatelessWidget {
  const GameThumbnail({
    super.key,
    required this.game,
  });

  final Game game;

  void _onClick(BuildContext context, Game game) {
    Navigator.of(context).pushNamed(GameInfoScreen.route, arguments: game);
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(game.thumbnailPath), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white.withAlpha(55)),
            padding: const EdgeInsets.all(5),
            child: Text(
              game.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ),
          InkWell(
            onTap: () => _onClick(context, game),
            hoverColor: Colors.white.withAlpha(55),
          ),
        ],
      ),
    );
  }
}
