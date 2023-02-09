import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/common/widgets/result_button.dart';
import '/common/widgets/vr_app_bar.dart';

class ResultsSummaryScreen extends StatelessWidget {
  const ResultsSummaryScreen({
    super.key,
    required this.games,
  });

  static const route = '/results-summary-screen';

  final List<Game> games;
  final double _spacing = 10;
  final double _buttonWidth = 300;
  final double _buttonRadius = 20;

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return Scaffold(
      appBar: VrAppBar(title: Text(texts.appProposedGames)),
      body: games.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              children: games
                  .map<Widget>(
                    (game) => ResultButton(
                      game,
                      width: _buttonWidth,
                      cornerRadius: _buttonRadius,
                      padding: EdgeInsets.only(top: _spacing),
                    ),
                  )
                  .toList(),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  texts.noGameFound,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
              )),
    );
  }
}
