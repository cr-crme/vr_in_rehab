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
    DecisionAlgorithm.of(context, listen: false).resetOptions();
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
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            ...algo
                .formattedOptions(context)
                .map<Widget>((button) => SectionButton(
                      button[0] as String,
                      options: button[1] as List<Option>,
                      width: _buttonWidth,
                      cornerRadius: _buttonRadius,
                      defaultOption: (button[2] as Option?)?.choice,
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
      ),
    );
  }
}
