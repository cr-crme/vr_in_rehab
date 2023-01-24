import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/common/providers/decision_algorithm.dart';
import '/common/widgets/section_button.dart';
import '/common/widgets/submit_button.dart';
import '/common/widgets/vr_app_bar.dart';
import '/screens/results_summary_screen.dart';

class FillingInfoScreen extends StatefulWidget {
  const FillingInfoScreen({super.key});

  static const route = '/filling-info-screen';

  @override
  State<FillingInfoScreen> createState() => _FillingInfoScreenState();
}

void _resetOptions(BuildContext context, {required bool listen}) {
  final algo = DecisionAlgorithm.of(context, listen: false);
  final options = DecisionAlgorithm.requiredOptions(context, listen: false);
  for (final category in options) {
    for (final option in category[1]) {
      algo.option = option;
    }
  }
}

class _FillingInfoScreenState extends State<FillingInfoScreen> {
  @override
  Widget build(BuildContext context) {
    // This stateful widget is there just to initialize everything.
    _resetOptions(context, listen: false);

    return const _FillingInfoContentScreen();
  }
}

class _FillingInfoContentScreen extends StatelessWidget {
  const _FillingInfoContentScreen();

  final double _spacing = 10;
  final double _buttonWidth = 250;
  final double _buttonRadius = 20;

  void _submit(BuildContext context) async {
    final algo = DecisionAlgorithm.of(context, listen: false);
    final navigator = Navigator.of(context);

    final games = await _analyseResults(context, algo);
    navigator.pushNamed(ResultsSummaryScreen.route, arguments: games);
  }

  Future<List<Game>> _analyseResults(
      BuildContext context, DecisionAlgorithm algo) async {
    final allGames = await readGames(
        'https://raw.githubusercontent.com/cr-crme/vr_in_readaptation/main/common/lib/assets/game_analyses/all_games.json');
    return algo.findCompatibleGames(allGames);
  }

  @override
  Widget build(BuildContext context) {
    final options = DecisionAlgorithm.requiredOptions(context);

    return Scaffold(
      appBar: VrAppBar(title: Text(LocaleText.of(context).appTitle)),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            ...options.map<Widget>((button) => SectionButton(
                  button[0] as String,
                  options: button[1] as List<Option>,
                  width: _buttonWidth,
                  cornerRadius: _buttonRadius,
                  defaultOption: (button[2] as Option).choice,
                  padding: EdgeInsets.only(top: _spacing),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: SubmitButton(
                  LocaleText.of(context).submit,
                  width: 150,
                  onPressed: () => _submit(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
