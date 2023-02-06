import '../locale_text.dart';
import 'option.dart';

class UpperExtremity extends Option {
  static const optionName = 'upper';

  const UpperExtremity.from({choice}) : super(optionName, choice: choice);

  static List<UpperExtremity> get values => [
        UpperExtremity.noArm,
        UpperExtremity.oneArm,
        UpperExtremity.bothArm,
        UpperExtremity.notImportant,
      ];
  static UpperExtremity get noArm => const UpperExtremity.from(choice: 0);
  static UpperExtremity get oneArm => const UpperExtremity.from(choice: 1);
  static UpperExtremity get bothArm => const UpperExtremity.from(choice: 2);
  static UpperExtremity get notImportant =>
      const UpperExtremity.from(choice: 3);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).noArm;
      case 1:
        return LocaleText.of(context, listen: listen).oneArm;
      case 2:
        return LocaleText.of(context, listen: listen).bothArm;
      case 3:
        return LocaleText.of(context, listen: listen).notImportant;
      default:
        return "Error";
    }
  }
}
