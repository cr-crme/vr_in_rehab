import '../locale_text.dart';
import 'option.dart';

class GameLength extends Option {
  const GameLength.from({choice = -1}) : super(choice: choice);

  static List<GameLength> get values => [
        GameLength.predetermined,
        GameLength.performanceBased,
        GameLength.notImportant,
      ];
  static GameLength get predetermined => const GameLength.from(choice: 0);
  static GameLength get performanceBased => const GameLength.from(choice: 1);
  static GameLength get notImportant => const GameLength.from(choice: 2);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).predetermined;
      case 1:
        return LocaleText.of(context, listen: listen).performanceBased;
      case 2:
        return LocaleText.of(context, listen: listen).notImportant;
      default:
        return "Error";
    }
  }
}
