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

class _FillingInfoScreenState extends State<FillingInfoScreen> {
  final double _spacing = 10;
  final double _buttonWidth = 250;
  final double _buttonRadius = 20;
  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    DecisionAlgorithm.of(context, listen: false).initializeOptions(context);
  }

  void _submit(BuildContext context) async {
    final algo = DecisionAlgorithm.of(context, listen: false);
    final navigator = Navigator.of(context);

    final games = await _analyseResults(context, algo);
    navigator.pushNamed(ResultsSummaryScreen.route, arguments: games);
  }

  Future<List<Game>> _analyseResults(
      BuildContext context, DecisionAlgorithm algo) async {
    final allGames = await readGames();
    return algo.findCompatibleGames(allGames);
  }

  void _onSelectOption(Option option, DecisionAlgorithm algo) {
    algo.option = option;
    _canSubmit = algo.allChoicesAreMade();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final algo = DecisionAlgorithm.of(context, listen: true);

    return Scaffold(
      appBar: VrAppBar(title: Text(LocaleText.of(context).appSelection)),
      body: ListView(
        shrinkWrap: true,
        children: [
          ...algo.allOptions.entries.map<Widget>((choice) => SectionButton(
                choice.value.title,
                tooltip: choice.value.tooltip,
                options: choice.value.availableChoices,
                allowMultipleChoices: choice.value.allowMultipleChoices,
                width: _buttonWidth,
                cornerRadius: _buttonRadius,
                highlightedOptions: choice.value.currentChoices.toInt(),
                padding: EdgeInsets.only(top: _spacing),
                onSelectOption: (val) => _onSelectOption(val, algo),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Tooltip(
                message: _canSubmit ? "" : texts.submitTooltip,
                child: SubmitButton(
                  texts.submit,
                  width: 150,
                  onPressed: _canSubmit ? () => _submit(context) : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
