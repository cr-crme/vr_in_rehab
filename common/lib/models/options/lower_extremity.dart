import '../locale_text.dart';
import 'option.dart';

class LowerExtremity extends Option {
  const LowerExtremity.from({choice = -1}) : super(choice: choice);

  static List<LowerExtremity> get values => [
        LowerExtremity.static,
        LowerExtremity.dynamicInside,
        LowerExtremity.dynamicOutside,
        LowerExtremity.notImportant,
      ];
  static LowerExtremity get static => const LowerExtremity.from(choice: 0);
  static LowerExtremity get dynamicInside =>
      const LowerExtremity.from(choice: 1);
  static LowerExtremity get dynamicOutside =>
      const LowerExtremity.from(choice: 2);
  static LowerExtremity get notImportant =>
      const LowerExtremity.from(choice: 3);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).static;
      case 1:
        return LocaleText.of(context, listen: listen).dynamicInside;
      case 2:
        return LocaleText.of(context, listen: listen).dynamicOuside;
      case 3:
        return LocaleText.of(context, listen: listen).notImportant;
      default:
        return "Error";
    }
  }
}
