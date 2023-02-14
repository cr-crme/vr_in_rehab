import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/common/providers/decision_algorithm.dart';
import '/common/widgets/result_button.dart';
import '/common/widgets/vr_app_bar.dart';

class ResultsSummaryScreen extends StatelessWidget {
  const ResultsSummaryScreen({
    super.key,
  });

  static const route = '/results-summary-screen';

  final double _spacing = 10;
  final double _buttonWidth = 300;
  final double _buttonRadius = 20;

  Future<List<Game>> _analyseResults(BuildContext context) async {
    final algo = DecisionAlgorithm.of(context, listen: false);
    final allGames = await readGames();
    return algo.findCompatibleGames(allGames);
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return FutureBuilder<List<Game>>(
        future: _analyseResults(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final games = snapshot.data!;
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
        });
  }
}
