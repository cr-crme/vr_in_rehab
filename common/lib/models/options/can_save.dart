import '../locale_text.dart';
import 'option.dart';

class CanSave extends Option {
  static const optionName = 'canSave';

  const CanSave.from({choice = -1}) : super(optionName, choice: choice);

  static List<CanSave> get values => [
        CanSave.cannotSave,
        CanSave.notImportant,
      ];
  static CanSave get cannotSave => const CanSave.from(choice: 0);
  static CanSave get notImportant => const CanSave.from(choice: 1);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).cannotSave;
      case 1:
        return LocaleText.of(context, listen: listen).notImportant;
      default:
        return "Error";
    }
  }
}
