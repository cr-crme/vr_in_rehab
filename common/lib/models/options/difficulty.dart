import '../locale_text.dart';
import 'option.dart';

class Difficulty extends Option {
  const Difficulty.from({choice = -1}) : super(choice: choice);

  static List<Difficulty> get values => [
        Difficulty.predetermined,
        Difficulty.adjustable,
        Difficulty.all,
      ];
  static Difficulty get predetermined => const Difficulty.from(choice: 0);
  static Difficulty get adjustable => const Difficulty.from(choice: 1);
  static Difficulty get all => const Difficulty.from(choice: 2);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).predetermined;
      case 1:
        return LocaleText.of(context, listen: listen).adjustable;
      case 2:
        return LocaleText.of(context, listen: listen).all;
      default:
        return "Error";
    }
  }
}
