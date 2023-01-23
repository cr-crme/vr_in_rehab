import '../locale_text.dart';
import 'option.dart';

class GameGoal extends Option {
  const GameGoal.from({choice = -1}) : super(choice: choice);

  static List<GameGoal> get values => [
        GameGoal.endurance,
        GameGoal.coordination,
        GameGoal.lowerExtremityStrength,
        GameGoal.balance,
        GameGoal.unimanualUpperExtremity,
        GameGoal.bimanualUpperExtremity,
        GameGoal.dualTasking,
        GameGoal.all,
      ];
  static GameGoal get endurance => const GameGoal.from(choice: 0);
  static GameGoal get coordination => const GameGoal.from(choice: 1);
  static GameGoal get lowerExtremityStrength => const GameGoal.from(choice: 2);
  static GameGoal get balance => const GameGoal.from(choice: 3);
  static GameGoal get unimanualUpperExtremity => const GameGoal.from(choice: 4);
  static GameGoal get bimanualUpperExtremity => const GameGoal.from(choice: 5);
  static GameGoal get dualTasking => const GameGoal.from(choice: 6);
  static GameGoal get all => const GameGoal.from(choice: 7);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).endurance;
      case 1:
        return LocaleText.of(context, listen: listen).coordination;
      case 2:
        return LocaleText.of(context, listen: listen).lowerExtremityStrength;
      case 3:
        return LocaleText.of(context, listen: listen).balance;
      case 4:
        return LocaleText.of(context, listen: listen).unimanualUpperExtremity;
      case 5:
        return LocaleText.of(context, listen: listen).bimanualUpperExtremity;
      case 6:
        return LocaleText.of(context, listen: listen).dualTasking;
      case 7:
        return LocaleText.of(context, listen: listen).all;
      default:
        return 'Error';
    }
  }
}
