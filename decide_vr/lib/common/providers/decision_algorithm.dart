import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecisionAlgorithm extends ChangeNotifier {
  DecisionAlgorithm({
    upperExtremity,
    lowerExtremity,
    gameGoal,
    contraindications,
    gameLength,
    difficulty,
    saveResuls,
  })  : _upperExtremity = upperExtremity ?? UpperExtremity.noArm,
        _lowerExtremity = lowerExtremity ?? LowerExtremity.static,
        _gameGoal = gameGoal ?? GameGoal.endurance,
        _contraindications =
            contraindications ?? Contraindications.noContraindication,
        _gameLength = gameLength ?? GameLength.predetermined,
        _difficulty = Difficulty.predetermined,
        _canSave = CanSave.canSave;

  static DecisionAlgorithm of(BuildContext context, {listen = true}) =>
      Provider.of<DecisionAlgorithm>(context, listen: listen);

  UpperExtremity? _upperExtremity;
  UpperExtremity? get upperExtremity => _upperExtremity;
  void setUpperExtremity(UpperExtremity value, {notify = true}) {
    _upperExtremity = value;
    if (notify) notifyListeners();
  }

  LowerExtremity? _lowerExtremity;
  LowerExtremity? get lowerExtremity => _lowerExtremity;
  void setLowerExtremity(LowerExtremity value, {notify = true}) {
    _lowerExtremity = value;
    if (notify) notifyListeners();
  }

  Contraindications? _contraindications;
  Contraindications? get contraindications => _contraindications;
  void setContraindications(Contraindications value, {notify = true}) {
    _contraindications = value;
    if (notify) notifyListeners();
  }

  GameGoal? _gameGoal;
  GameGoal? get gameGoal => _gameGoal;
  void setGameGoal(GameGoal value, {notify = true}) {
    _gameGoal = value;
    if (notify) notifyListeners();
  }

  GameLength? _gameLength;
  GameLength? get gameLength => _gameLength;
  void setGameLength(GameLength value, {notify = true}) {
    _gameLength = value;
    if (notify) notifyListeners();
  }

  Difficulty? _difficulty;
  Difficulty? get difficulty => _difficulty;
  void setDifficulty(Difficulty value, {notify = true}) {
    _difficulty = value;
    if (notify) notifyListeners();
  }

  CanSave? _canSave;
  CanSave? get canSave => _canSave;
  void setCanSave(CanSave value, {notify = true}) {
    _canSave = value;
    if (notify) notifyListeners();
  }

  bool allChoicesAreMade() {
    return _upperExtremity != null &&
        _lowerExtremity != null &&
        _contraindications != null &&
        _gameGoal != null &&
        _gameLength != null &&
        _difficulty != null &&
        _canSave != null;
  }

  void resetOptions() {
    _upperExtremity = null;
    _lowerExtremity = null;
    _contraindications = null;
    _gameGoal = null;
    _gameLength = null;
    _difficulty = null;
    _canSave = null;
  }

  List formattedOptions(BuildContext context, {listen = true}) {
    final texts = LocaleText.of(context, listen: listen);
    return [
      [texts.upperExtremity, UpperExtremity.values, _upperExtremity],
      [texts.lowerExtremity, LowerExtremity.values, _lowerExtremity],
      [texts.contraindications, Contraindications.values, _contraindications],
      [texts.gameGoal, GameGoal.values, _gameGoal],
      [texts.gameLength, GameLength.values, _gameLength],
      [texts.difficulty, Difficulty.values, _difficulty],
      [texts.saveResults, CanSave.values, _canSave],
    ];
  }

  set option(value) {
    if (value is UpperExtremity) {
      _upperExtremity = value;
    } else if (value is LowerExtremity) {
      _lowerExtremity = value;
    } else if (value is Contraindications) {
      _contraindications = value;
    } else if (value is GameGoal) {
      _gameGoal = value;
    } else if (value is GameLength) {
      _gameLength = value;
    } else if (value is Difficulty) {
      _difficulty = value;
    } else if (value is CanSave) {
      _canSave = value;
    } else {
      throw "Unrecognized option";
    }
  }

  List<Game> findCompatibleGames(List<Game> from) {
    // Subsequently filter more and more

    // Upper extremity
    var out = from.where((game) =>
        _upperExtremity == UpperExtremity.notImportant ||
        game.upperExtremity.contains(_upperExtremity));

    // Lower extremity
    out = out.where((game) =>
        _lowerExtremity == LowerExtremity.notImportant ||
        game.lowerExtremity.contains(_lowerExtremity));

    // Contraindication
    out = out.where((game) =>
        _contraindications == Contraindications.noContraindication ||
        game.contraindications.contains(_contraindications));

    // Game goal
    out = out.where((game) =>
        _gameGoal == GameGoal.notImportant || game.goal.contains(_gameGoal));

    // Game length
    out = out.where((game) =>
        _gameLength == GameLength.notImportant ||
        game.length.contains(_gameLength));

    // Difficulty
    out = out.where((game) =>
        _difficulty == Difficulty.notImportant ||
        game.difficulty == _difficulty);

    // Can save
    out = out.where(
        (game) => _canSave == CanSave.notImportant || game.canSave == _canSave);

    return out.toList();
  }
}
