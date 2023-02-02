import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleText with ChangeNotifier {
  LocaleText({required this.language});

  static const String tab = '    ';
  static const String bullet = '\u2022';

  void setLanguage(language) {
    this.language = language;
    notifyListeners();
  }

  String language;

  static LocaleText of(BuildContext context, {bool listen = true}) {
    return Provider.of<LocaleText>(context, listen: listen);
  }

  String get appExplanation => {
        'en': 'This app will help you choose a VR that corresponds to your'
            'patient\'s need',
        'fr': 'Cette application vous aidera à choisir un jeu de RV qui '
            'correspond aux besoin de votre patient'
      }[language]!;
  String get appTitle =>
      {'en': 'Decide your VR game', 'fr': 'Choisi ton jeu RV'}[language]!;
  String get appProposedGames => {
        'en': 'Here a selection of games',
        'fr': 'Voici une sélection de jeux'
      }[language]!;
  String get all => {'en': 'All', 'fr': 'Tous'}[language]!;

  String get upperExtremity =>
      {'en': 'Upper extremity', 'fr': 'Membres supérieurs'}[language]!;
  String get noArm => {'en': 'No arm', 'fr': 'Aucun bras'}[language]!;
  String get oneArm => {'en': 'One arm', 'fr': 'Un bras'}[language]!;
  String get bothArm => {'en': 'Both arm', 'fr': 'Deux bras'}[language]!;

  String get lowerExtremity =>
      {'en': 'Lower extremity', 'fr': 'Membres inférieurs'}[language]!;
  String get static => {'en': 'Static', 'fr': 'Statique'}[language]!;
  String get dynamicInside =>
      {'en': 'Inside base support', 'fr': 'Dans la base de support'}[language]!;
  String get dynamicOuside => {
        'en': 'Outside base support',
        'fr': 'À l\'extérieur de la base de support'
      }[language]!;

  String get gameGoal => {'en': 'Game use goal', 'fr': 'But du jeu'}[language]!;
  String get endurance => {'en': 'Endurance', 'fr': 'Endurance'}[language]!;
  String get coordination =>
      {'en': 'Coordination', 'fr': 'Coordination'}[language]!;
  String get lowerExtremityStrength => {
        'en': 'Lower extremity strength',
        'fr': 'Force dans les jambes'
      }[language]!;
  String get balance => {'en': 'Balance', 'fr': 'Équilibre'}[language]!;
  String get unimanualUpperExtremity =>
      {'en': 'Unimanual upper extremity', 'fr': 'Un bras'}[language]!;
  String get bimanualUpperExtremity =>
      {'en': 'Bimanual upper extremity', 'fr': 'Ambidextrie'}[language]!;
  String get dualTasking =>
      {'en': 'Dual tasking', 'fr': 'Double tâche'}[language]!;

  String get environment =>
      {'en': 'Environment', 'fr': 'Environnement'}[language]!;
  String get clinic => {'en': 'Clinic', 'fr': 'Clinique'}[language]!;
  String get homeWithTherapist =>
      {'en': 'Home with therapist', 'fr': 'Thérapie à la maison'}[language]!;
  String get home => {'en': 'Home', 'fr': 'À la maison'}[language]!;

  String get contraindications =>
      {'en': 'Contraindications', 'fr': 'Contre-indications'}[language]!;
  String get epilepsy => {'en': 'Epilepsy', 'fr': 'Épilepsie'}[language]!;
  String get colorBlind => {'en': 'Color blind', 'fr': 'Daltonien'}[language]!;
  String get none => {'en': 'None', 'fr': 'Aucune'}[language]!;

  String get gameLength =>
      {'en': 'Game length', 'fr': 'Durée de jeu'}[language]!;
  String get predetermined =>
      {'en': 'Predetermined', 'fr': 'Prédéterminée'}[language]!;
  String get performanceBased =>
      {'en': 'Performance based', 'fr': 'Basée sur la performance'}[language]!;

  String get difficulty => {'en': 'Difficulty', 'fr': 'Difficulté'}[language]!;
  String get adjustable => {'en': 'Adjustable', 'fr': 'Ajustable'}[language]!;

  String get saveResults =>
      {'en': 'Saving results', 'fr': 'Sauvegarde des résultats'}[language]!;
  String get canSave => {'en': 'Can save', 'fr': 'Possible'}[language]!;
  String get cannotSave => {'en': 'Cannot save', 'fr': 'Impossible'}[language]!;

  String get submit => {'en': 'Submit', 'fr': 'Soumettre'}[language]!;
  String get start => {'en': 'Start', 'fr': 'Débuter'}[language]!;

  String get informationNotAvailable => {
        'en': 'Information not available',
        'fr': 'Informations non disponibles'
      }[language]!;
  String get moreInformation =>
      {'en': 'More information...', 'fr': 'Plus d\'information...'}[language]!;
  String get lessInformation =>
      {'en': 'Less information...', 'fr': 'Moins d\'information...'}[language]!;
  String get description =>
      {'en': 'Description', 'fr': 'Description'}[language]!;
  String get accessories =>
      {'en': 'Accessories', 'fr': 'Accessoires'}[language]!;
  String get time => {'en': 'Time', 'fr': 'Temps'}[language]!;
  String get position =>
      {'en': 'Position to play', 'fr': 'Position de jeu'}[language]!;
  String get numberPlayers =>
      {'en': 'Number of players', 'fr': 'Nombre de joueurs'}[language]!;
  String get progression =>
      {'en': 'Progression in game', 'fr': 'Progression dans le jeu'}[language]!;
  String get performanceFeedback => {
        'en': 'Performance feedback',
        'fr': 'Connaissance de la performance'
      }[language]!;
  String get resultsFeedback => {
        'en': 'Knowledge of results',
        'fr': 'Connaissance des résultats'
      }[language]!;
  String get physicalRequirements => {
        'en': 'Physical requirements',
        'fr': 'Exigences physiques minimales'
      }[language]!;
  String get motorSkills =>
      {'en': 'Motor skills', 'fr': 'Habiletés motrices'}[language]!;
  String get sideNotes =>
      {'en': 'Side notes', 'fr': 'Considérations particulières'}[language]!;
  String get cognitiveRequirements =>
      {'en': 'Cognitive requirements', 'fr': 'Exigences cognitives'}[language]!;

  String get colon => {
        'en': ':',
        'fr': ' :',
      }[language]!;

  String get websiteTitle => {
        'en': 'Virtual reality in readapt',
        'fr': 'La réalité virtuelle en réadaptation',
      }[language]!;
  String get generalityAndDescription => {
        'en': 'Description and generality',
        'fr': 'Description et généralité',
      }[language]!;
  String get consoles => {
        'en': 'Consoles',
        'fr': 'Consoles',
      }[language]!;
  String get forum => {
        'en': 'Forum',
        'fr': 'Forum',
      }[language]!;
  String get ressources => {
        'en': 'Ressources',
        'fr': 'Ressources',
      }[language]!;

  String get generalityWhatIsVrTitle => {
        'en': 'What is virtual reality (VR)?',
        'fr': 'Qu\'est-ce que la réalité virtuelle (RV)',
      }[language]!;
  String get generalityWhatIsVrText => {
        'en':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vehicula ante nec ante vehicula, vel facilisis tellus varius. Quisque fermentum orci in lorem feugiat laoreet. Pellentesque id urna ultrices, mollis nibh sed, malesuada tortor. Curabitur elit libero, mollis ornare luctus non, ultricies eget odio. Sed posuere nunc mi, vel auctor tellus dapibus vel. Vestibulum sed efficitur diam, id volutpat nisi. Ut placerat, sapien eget aliquam tempor, orci sapien efficitur elit, sit amet fermentum massa ante ac sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas vitae eros sagittis enim dignissim scelerisque. Integer pulvinar nulla id turpis vestibulum suscipit. Sed ac ligula at odio aliquam pulvinar. Nulla vel lacus tellus. Pellentesque at lectus non lectus lacinia pretium in ac est.',
        'fr':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vehicula ante nec ante vehicula, vel facilisis tellus varius. Quisque fermentum orci in lorem feugiat laoreet. Pellentesque id urna ultrices, mollis nibh sed, malesuada tortor. Curabitur elit libero, mollis ornare luctus non, ultricies eget odio. Sed posuere nunc mi, vel auctor tellus dapibus vel. Vestibulum sed efficitur diam, id volutpat nisi. Ut placerat, sapien eget aliquam tempor, orci sapien efficitur elit, sit amet fermentum massa ante ac sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas vitae eros sagittis enim dignissim scelerisque. Integer pulvinar nulla id turpis vestibulum suscipit. Sed ac ligula at odio aliquam pulvinar. Nulla vel lacus tellus. Pellentesque at lectus non lectus lacinia pretium in ac est.',
      }[language]!;

  String get generalityImmersiveVsNonImmersiveTitle => {
        'en': 'Immersive VS non-immersive virtual reality?',
        'fr': 'Immersive VS non-immersive réalité virtuelle?',
      }[language]!;
  String get generalityImmersiveVsNonImmersiveText => {
        'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
        'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
      }[language]!;

  String get generalityProsOfVrTitle => {
        'en': 'Pros of virtual reality in pediatric rehab',
        'fr': 'Avantages de la réalité virtuelle en réadaptation pédiatrique',
      }[language]!;
  String get generalityProsOfVrText => {
        'en': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
        'fr': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
      }[language]!;

  String get generalityContraindicationVrTitle => {
        'en': 'Contraindications and precautions',
        'fr': 'Contre-indications et précautions',
      }[language]!;
  String get generalityContraindicationVrText => {
        'en': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
        'fr': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
      }[language]!;

  String get generalityWebsiteNavigationTitle => {
        'en': 'Navigating this website',
        'fr': 'Fonctionnement du site internet',
      }[language]!;
  String get generalityWebsiteNavigationText => {
        'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
        'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
      }[language]!;

  String get consoleClickHereForGames => {
        'en': 'Click here to see the games for this console',
        'fr': 'Cliquer ici pour voir les jeux sur cette console',
      }[language]!;
  String get consoleImmersiveTitle => {
        'en': 'Immersive / non-immersive',
        'fr': 'Immersive / non-immersive',
      }[language]!;
  String get consoleTargetTitle => {
        'en': 'Created for the readaptation or for the general public',
        'fr': 'Créée pour la réadaptation ou pour le grand public',
      }[language]!;
  String get consoleRequiredSpaceTitle => {
        'en': 'Required space',
        'fr': 'Espace requis',
      }[language]!;
  String get consolePrecautionsTitle => {
        'en': 'Precautions',
        'fr': 'Précautions',
      }[language]!;
  String get consoleEquipmentsTitle => {
        'en': 'Equipments',
        'fr': 'Équipements',
      }[language]!;
  String get consoleCostsTitle => {
        'en': 'Costs',
        'fr': 'Coûts',
      }[language]!;

  String get ressourcesListTitle => {
        'en': 'List of ressources',
        'fr': 'Liste des ressources',
      }[language]!;
  String get ressourcesListText => {
        'en': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
        'fr': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
      }[language]!;
  String get ressourcesContactUsTitle => {
        'en': 'Contact us',
        'fr': 'Nous contacter',
      }[language]!;
  String get ressourcesContactUsText => {
        'en': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n',
        'fr': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n',
      }[language]!;
}
