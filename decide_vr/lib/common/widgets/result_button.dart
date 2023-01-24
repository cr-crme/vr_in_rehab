import 'package:auto_size_text/auto_size_text.dart';
import 'package:common/common.dart';
import 'package:decide_vr/screens/result_game_details_screen.dart';
import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  const ResultButton(
    this.game, {
    super.key,
    this.width = 200,
    this.cornerRadius = 20,
    this.padding,
  });

  final Game game;

  final double width;
  final double cornerRadius;
  final EdgeInsets? padding;

  void _viewGameDetails(BuildContext context, Game game) {
    Navigator.of(context)
        .pushNamed(ResultGameDetailsScreen.route, arguments: game);
  }

  @override
  Widget build(BuildContext context) {
    final paddingChild = Center(
      child: ElevatedButton(
        onPressed: () => _viewGameDetails(context, game),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              '${game.title}${game.collection != '' ? ' from ${game.collection}' : ''}',
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              game.console,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
    return padding != null
        ? Padding(
            padding: padding!,
            child: paddingChild,
          )
        : paddingChild;
  }
}
