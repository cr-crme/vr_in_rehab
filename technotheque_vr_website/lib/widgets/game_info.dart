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
            '${texts.description}${texts.colon} ${_optionsToString(context, game.description)}'),
        Text(
            '${texts.time}${texts.colon} ${_optionsToString(context, game.time)}'),
        Text(
            '${texts.position}${texts.colon} ${_optionsToString(context, game.position)}'),
        Text(
            '${texts.numberPlayers}${texts.colon} ${_optionsToString(context, game.numberPlayers)}'),
        Text(
            '${texts.progression}${texts.colon} ${_optionsToString(context, game.progression)}'),
        Text(
            '${texts.performanceFeedback}${texts.colon} ${_optionsToString(context, game.performanceFeedback)}'),
        Text(
            '${texts.resultsFeedback}${texts.colon} ${_optionsToString(context, game.resultsFeedback)}'),
        Text(
            '${texts.physicalRequirements}${texts.colon} ${_optionsToString(context, game.physicalRequirements)}'),
        Text(
            '${texts.motorSkills}${texts.colon} ${_optionsToString(context, game.motorSkills)}'),
        Text(
            '${texts.sideNotes}${texts.colon} ${_optionsToString(context, game.sideNotes)}'),
        Text(
            '${texts.cognitiveRequirements}${texts.colon} ${_optionsToString(context, game.cognitiveRequirements)}'),
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
