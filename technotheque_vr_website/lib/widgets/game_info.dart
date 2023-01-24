import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          game.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(decoration: TextDecoration.underline),
        ),
        Text(
            '${texts.gameGoal}${texts.colon} ${_optionsToString(context, game.goal)}'),
        Text(
            '${texts.gameLength}${texts.colon} ${_optionsToString(context, game.length)}'),
        Text(
            '${texts.difficulty}${texts.colon} ${_optionsToString(context, game.difficulty)}'),
        Text(
            '${texts.upperExtremity}${texts.colon} ${_optionsToString(context, game.upperExtremity)}'),
        Text(
            '${texts.lowerExtremity}${texts.colon} ${_optionsToString(context, game.lowerExtremity)}'),
        Text(
            '${texts.contraindications}${texts.colon} ${_optionsToString(context, game.contraindications)}'),
        Text(
            '${texts.saveResults}${texts.colon} ${_optionsToString(context, game.canSave)}'),
      ],
    );
  }

  String _optionsToString(BuildContext context, options) {
    if (options is Option) {
      return '\n${LocaleText.tab}${LocaleText.tab}${options.title(context)}';
    }

    final list =
        (options as OptionList).map<String>((option) => option.title(context));

    String out = '';
    for (final e in list) {
      out = '$out\n${LocaleText.tab}${LocaleText.tab}$e';
    }
    return out;
  }
}
