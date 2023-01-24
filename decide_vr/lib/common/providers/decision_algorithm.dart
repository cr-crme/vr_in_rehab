import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecisionAlgorithm extends ChangeNotifier {
  DecisionAlgorithm({
    upperExtremity,
    lowerExtremity,
    sittingAbility,
    standingAbility,
    gameGoal,
    environment,
    contraindications,
    gameLength,
    difficulty,
    saveResuls,
  })  : _upperExtremity = upperExtremity ?? UpperExtremity.noArm,
        _lowerExtremity = lowerExtremity ?? LowerExtremity.static,
        _sittingAbility = sittingAbility ?? SittingAbility.dynamicWithSupport,
        _standingAbility =
            standingAbility ?? StandingAbility.dynamicWithSupport,
        _gameGoal = gameGoal ?? GameGoal.endurance,
        _environment = environment ?? Environment.clinic,
        _contraindications = contraindications ?? Contraindications.none,
        _gameLength = gameLength ?? GameLength.predetermined,
        _difficulty = Difficulty.predetermined,
        _canSave = CanSave.canSave;

  static DecisionAlgorithm of(BuildContext context, {listen = true}) =>
      Provider.of<DecisionAlgorithm>(context, listen: listen);

  UpperExtremity _upperExtremity;
  UpperExtremity get upperExtremity => _upperExtremity;
  void setUpperExtremity(UpperExtremity value, {notify = true}) {
    _upperExtremity = value;
    if (notify) notifyListeners();
  }

  LowerExtremity _lowerExtremity;
  LowerExtremity get lowerExtremity => _lowerExtremity;
  void setLowerExtremity(LowerExtremity value, {notify = true}) {
    _lowerExtremity = value;
    if (notify) notifyListeners();
  }

  SittingAbility _sittingAbility;
  SittingAbility get sittingAbility => _sittingAbility;
  void setSittingAbility(SittingAbility value, {notify = true}) {
    _sittingAbility = value;
    if (notify) notifyListeners();
  }

  StandingAbility _standingAbility;
  StandingAbility get standingAbility => _standingAbility;
  void setStandingAbility(StandingAbility value, {notify = true}) {
    _standingAbility = value;
    if (notify) notifyListeners();
  }

  GameGoal _gameGoal;
  GameGoal get gameGoal => _gameGoal;
  void setGameGoal(GameGoal value, {notify = true}) {
    _gameGoal = value;
    if (notify) notifyListeners();
  }

  Environment _environment;
  Environment get environment => _environment;
  void setEnvironment(Environment value, {notify = true}) {
    _environment = value;
    if (notify) notifyListeners();
  }

  Contraindications _contraindications;
  Contraindications get contraindications => _contraindications;
  void setContraindications(Contraindications value, {notify = true}) {
    _contraindications = value;
    if (notify) notifyListeners();
  }

  GameLength _gameLength;
  GameLength get gameLength => _gameLength;
  void setGameLength(GameLength value, {notify = true}) {
    _gameLength = value;
    if (notify) notifyListeners();
  }

  Difficulty _difficulty;
  Difficulty get difficulty => _difficulty;
  void setDifficulty(Difficulty value, {notify = true}) {
    _difficulty = value;
    if (notify) notifyListeners();
  }

  CanSave _canSave;
  CanSave get canSave => _canSave;
  void setCanSave(CanSave value, {notify = true}) {
    _canSave = value;
    if (notify) notifyListeners();
  }

  static List requiredOptions(BuildContext context, {listen = true}) {
    final texts = LocaleText.of(context, listen: listen);
    return [
      [texts.upperExtremity, UpperExtremity.values, UpperExtremity.all],
      [texts.lowerExtremity, LowerExtremity.values, LowerExtremity.all],
      [
        texts.contraindications,
        Contraindications.values,
        Contraindications.none
      ],
      [texts.gameGoal, GameGoal.values, GameGoal.all],
      [texts.gameLength, GameLength.values, GameLength.all],
      [texts.difficulty, Difficulty.values, Difficulty.all],
      [texts.saveResults, CanSave.values, CanSave.all],
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
        _upperExtremity == UpperExtremity.all ||
        game.upperExtremity.contains(_upperExtremity));

    // Lower extremity
    out = out.where((game) =>
        _lowerExtremity == LowerExtremity.all ||
        game.lowerExtremity.contains(_lowerExtremity));

    // Contraindication
    out = out.where((game) =>
        _contraindications == Contraindications.none ||
        game.contraindications.contains(_contraindications));

    // Game goal
    out = out.where(
        (game) => _gameGoal == GameGoal.all || game.goal.contains(_gameGoal));

    // Game length
    out = out.where((game) =>
        _gameLength == GameLength.all || game.length.contains(_gameLength));

    // Difficulty
    out = out.where((game) =>
        _difficulty == Difficulty.all || game.difficulty == _difficulty);

    // Can save
    out = out
        .where((game) => _canSave == CanSave.all || game.canSave == _canSave);

    return out.toList();
  }
}
