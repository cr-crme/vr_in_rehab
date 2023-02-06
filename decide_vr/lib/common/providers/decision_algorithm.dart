import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormattedOption<T extends Option> {
  FormattedOption({
    required this.title,
    required this.availableChoices,
    required this.currentChoices,
    required this.allowMultipleChoices,
    this.acceptAll,
  });
  final String title;
  final List<T> availableChoices;
  OptionList<T> currentChoices;
  final bool allowMultipleChoices;
  final Option? acceptAll;
}

class DecisionAlgorithm extends ChangeNotifier {
  DecisionAlgorithm();

  static DecisionAlgorithm of(BuildContext context, {listen = true}) =>
      Provider.of<DecisionAlgorithm>(context, listen: listen);

  Map<Type, FormattedOption> allOptions = {};

  bool allChoicesAreMade() {
    for (final key in allOptions.keys) {
      if (allOptions[key]!.currentChoices.isEmpty) return false;
    }
    return true;
  }

  void initializeOptions(BuildContext context) {
    final texts = LocaleText.of(context, listen: false);
    allOptions = {
      UpperExtremity: FormattedOption<UpperExtremity>(
        title: texts.upperExtremity,
        availableChoices: UpperExtremity.values,
        currentChoices: OptionList(),
        allowMultipleChoices: false,
        acceptAll: UpperExtremity.notImportant,
      ),
      LowerExtremity: FormattedOption<LowerExtremity>(
        title: texts.lowerExtremity,
        availableChoices: LowerExtremity.values,
        currentChoices: OptionList(),
        allowMultipleChoices: false,
        acceptAll: LowerExtremity.notImportant,
      ),
      Contraindications: FormattedOption<Contraindications>(
        title: texts.contraindications,
        availableChoices: Contraindications.values,
        currentChoices: OptionList(),
        allowMultipleChoices: false,
        acceptAll: Contraindications.noContraindication,
      ),
      GameGoal: FormattedOption<GameGoal>(
        title: texts.gameGoal,
        availableChoices: GameGoal.values,
        currentChoices: OptionList(),
        allowMultipleChoices: true,
        acceptAll: GameGoal.notImportant,
      ),
      GameLength: FormattedOption<GameLength>(
        title: texts.gameLength,
        availableChoices: GameLength.values,
        currentChoices: OptionList(),
        allowMultipleChoices: false,
        acceptAll: GameLength.notImportant,
      ),
      Difficulty: FormattedOption<Difficulty>(
        title: texts.difficulty,
        availableChoices: Difficulty.values,
        currentChoices: OptionList(),
        allowMultipleChoices: false,
        acceptAll: Difficulty.notImportant,
      ),
      CanSave: FormattedOption<CanSave>(
        title: texts.saveResults,
        availableChoices: CanSave.values,
        currentChoices: OptionList(),
        allowMultipleChoices: false,
        acceptAll: CanSave.notImportant,
      ),
    };
  }

  set option(Option value) {
    var selectedOption = allOptions[value.runtimeType];
    if (selectedOption == null) {
      throw 'Unrecognized option';
    }

    if (!selectedOption.allowMultipleChoices) {
      // If only one choice is available, clear the previous options
      selectedOption.currentChoices.clear();
    }

    if (selectedOption.currentChoices.contains(value)) {
      selectedOption.currentChoices.remove(value);
    } else {
      // If there is an [all options], make sure it is the sole selected
      final acceptAll = allOptions[value.runtimeType]!.acceptAll;
      if (acceptAll != null &&
          (value == acceptAll ||
              selectedOption.currentChoices.contains(acceptAll))) {
        selectedOption.currentChoices.clear();
      }
      selectedOption.currentChoices.add(value);
    }
  }

  List<Game> findCompatibleGames(List<Game> from) {
    // Subsequently filter more and more
    var out = from.toList();

    // Upper extremity
    for (final key in allOptions.keys) {
      out = out.where((game) {
        final option = allOptions[key]!;
        if (option.currentChoices.isEmpty) {
          throw 'All criteria should have a chosen criteria';
        }
        if (option.currentChoices.contains(option.acceptAll)) return true;
        for (final choice in option.currentChoices) {
          if (!game.decisionOptions[key]!.contains(choice)) return false;
        }
        return true;
      }).toList();
    }

    return out.toList();
  }
}
