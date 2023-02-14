import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    super.key,
    required this.game,
  });

  final Game game;

  Widget _buildText(BuildContext context, String title, String text) {
    final textStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white);
    const titleStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Color.fromARGB(255, 123, 255, 213));

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextWithTitle(title, text,
          titleStyle: titleStyle, textStyle: textStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          game.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(decoration: TextDecoration.underline),
        ),
        _buildText(context, texts.description, game.description(context)),
        _buildText(context, texts.time, game.time(context)),
        _buildText(context, texts.position, game.position(context)),
        _buildText(context, texts.numberPlayers, game.numberPlayers(context)),
        _buildText(context, texts.progression, game.progression(context)),
        _buildText(context, texts.performanceFeedback,
            game.performanceFeedback(context)),
        _buildText(
            context, texts.resultsFeedback, game.resultsFeedback(context)),
        _buildText(context, texts.physicalRequirements,
            game.physicalRequirements(context)),
        _buildText(context, texts.motorSkills, game.motorSkills(context)),
        _buildText(context, texts.sideNotes, game.sideNotes(context)),
        _buildText(context, texts.cognitiveRequirements,
            game.cognitiveRequirements(context)),
      ],
    );
  }
}
