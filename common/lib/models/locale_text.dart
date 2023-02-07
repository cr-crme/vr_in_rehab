import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleText with ChangeNotifier {
  LocaleText({required this.language});

  static const String tab = '     ';
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
            'correspond aux besoins de votre patient'
      }[language]!;
  String get appTitle =>
      {'en': 'Decide your VR game', 'fr': 'Choisi ton jeu RV'}[language]!;
  String get appSelection => {
        'en': 'Choose the criteria for each category',
        'fr': 'Choisir les critères pour chacune des catégories'
      }[language]!;
  String get appProposedGames => {
        'en': 'Here a selection of games',
        'fr': 'Voici une sélection de jeux'
      }[language]!;
  String get all => {'en': 'All', 'fr': 'Tous'}[language]!;
  String get notImportant =>
      {'en': 'Not important', 'fr': 'Sans importance'}[language]!;

  String get upperExtremity =>
      {'en': 'Upper extremity', 'fr': 'Membres supérieurs'}[language]!;
  String get noArm => {'en': 'No arm', 'fr': 'Aucun bras'}[language]!;
  String get oneArm => {'en': 'One arm', 'fr': 'Un bras'}[language]!;
  String get bothArm => {'en': 'Both arm', 'fr': 'Deux bras'}[language]!;
  String get allArm =>
      {'en': 'Non applicable', 'fr': 'Non applicable'}[language]!;

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
  String get noContraindication => {
        'en': 'No contraindication',
        'fr': 'Pas de contre-indication'
      }[language]!;

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
  String get canSave => {'en': 'Yes', 'fr': 'Oui'}[language]!;
  String get cannotSave => {'en': 'No', 'fr': 'Non'}[language]!;

  String get submit => {'en': 'Submit', 'fr': 'Soumettre'}[language]!;
  String get submitTooltip => {
        'en': 'All options must be selected to submit',
        'fr':
            'Toutes les options doivent avoir été sélectionnées pour soumettre'
      }[language]!;
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
        'en': 'To translate',
        'fr': 'La réalité virtuelle (RV) et les jeux vidéos actifs sont des '
            'modalités de traitement émergentes dans le domaine de la '
            'physiothérapie. Ce sont des systèmes où les joueurs utilisent le '
            'mouvement de leur corps pour interagir avec les objets de '
            'l\'univers virtuel (Levac et al. 2017).',
      }[language]!;

  String get generalityImmersiveVsNonImmersiveTitle => {
        'en': 'Immersive VS non-immersive virtual reality?',
        'fr': 'Immersive VS non-immersive réalité virtuelle?',
      }[language]!;
  String get generalityImmersiveVsNonImmersiveText => {
        'en': 'To translate',
        'fr': 'Il y a deux types de RV : immersive ou non-immersive. La RV '
            'immersive fait référence à l\'utilisation d\'un casque audiovisuel '
            'qui permet de s\'immerser dans l\'environnement du jeu.\n\n'
            'La RV non-immersive fait référence à l\'utilisation d\'une console de '
            'jeu pour interagir avec un environnement virtuel, sans toutefois '
            'donner l\'impression de faire partie de cet environnement (Omlor et '
            'al., Medical Education Online, 2022).',
      }[language]!;

  String get generalityProsOfVrTitle => {
        'en': 'Pros of virtual reality in pediatric rehab',
        'fr': 'Avantages de la réalité virtuelle en réadaptation pédiatrique',
      }[language]!;
  String get generalityProsOfVrText => {
        'en': 'To translate',
        'fr': '$tab$bullet Peut mimer des tâches de la vie réelle (Levac et al. 2015)\n'
            '$tab$bullet Demande une participation active du patient (Levac et al. 2015)\n'
            '$tab$bullet Travaille la relation entre la posture et le mouvement '
            'en plus de donner beaucoup de rétroactions (Levac et al. 2015)\n'
            '$tab$bullet C\'est une modalité qui est stimulante, motivante et '
            'dont il est possible de l\'adapter pour individualiser les '
            'traitements vu les nombreux jeux variables disponible sur le '
            'marché (Lino, Arcangeli, and Chieffo 2021).\n'
            '$tab$bullet L\'utilisation de la RV permet d\'augmenter la durée '
            'des traitements, le nombre de répétitions complétés et '
            'l\'intensité des sessions en plus de procurer une rétroaction '
            'constante (Banerjee-Guénette, Bigford, and Glegg 2020).\n'
            '$tab$bullet Modalité qui suit les principes de la neuroplasticité '
            'qui stipule que les tâches motivantes, répétitives et orientées '
            'sur la tâche avec une rétroaction multisensorielle permettent un '
            'meilleur apprentissage moteur (Levac and Miller 2013).\n'
            '$tab$bullet La RV a été validé pour la réadaptation motrice et '
            'cognitive avec de nombreuses conditions tels le trouble du spectre '
            'de l\'autisme (TSA), le trouble du déficit de l\'attention avec '
            'hyperactivité (TDAH) , la paralysie cérébrale et son utilisation '
            'est de plus en plus supporté pour le traitement du trouble '
            'neurodéveloppemental de la coordination (TDC) (Lino et al. 2021).\n'
            '$tab$bullet L\'utilisation de la RV en réadaptation permettrait de '
            'travailler tous les domaines de la CIF (déficiences, limitations '
            'd\'activités, restrictions de participation, facteurs personnels et '
            'facteurs environnementaux), ce qui correspond aux objectifs de '
            'traitements établis par les professionnels de la physiothérapie '
            '(Lino et al. 2021). En effet, l\'environnement virtuel permet de '
            'travailler des tâches que l\'enfant réaliserait dans la vie '
            'réelle (Galvin and Levac 2011).\n',
      }[language]!;

  String get generalityContraindicationVrTitle => {
        'en': 'Contraindications and precautions',
        'fr': 'Contre-indications et précautions',
      }[language]!;
  String get generalityContraindicationVrText => {
        'en': 'To translate',
        'fr': 'La RV immersive est contre-indiquée pour les cas suivants :\n'
            '$tab$bullet  Épilepsie\n\n'
            'Pour la RV immersive, les précautions sont les suivantes :\n'
            '$tab$bullet Joueur pourrait trébucher dans des objets s\'il n\'a pas l\'espace adéquat\n'
            '$tab$bullet Casque peut donner des nausées, étourdissements et mal de cœur\n'
            '$tab$bullet Casque pourrait tomber s\'il est mal ajusté\n'
            '$tab$bullet Casque peut effectuer une pression inconfortable sur le visage\n'
            '$tab$bullet Le joueur peut avoir de la difficulté à repérer son corps dans l\'espace'
      }[language]!;

  String get generalityWebsiteNavigationTitle => {
        'en': 'Navigating this website',
        'fr': 'Fonctionnement du site internet',
      }[language]!;
  String get generalityWebsiteNavigationText => {
        'en': 'To translate',
        'fr': 'Le site web se veut un outil informatif qui permet aux cliniciens '
            'd\'avoir rapidement l\'information sur les différents jeux qui '
            'existent pour prendre leur décision sur l\'intervention approprié '
            'pour l\'enfants en thérapie. 7 différentes consoles ont été analysées '
            'et plusieurs jeux par consoles, pour un grand total de plus de 100 jeux '
            'disponibles dans ce site.\n'
            '\n'
            'Les informations qui se retrouvent pour chaque console sont les suivantes :'
            '$tab$bullet Type de RV : immersive vs non-immersive? Il y a '
            'certaines précautions à prendre en compte pour la RV immersive, '
            'certains enfants ne la toléreront pas ou il est contre-indiqué '
            'qu\'ils l\'utilisent.\n'
            '$tab$bullet La consoles a-t-elle été créée pour la réadaptation ou '
            'pour le grand public? Dans les consoles qui sont créées '
            'spécifiquement pour la réadaptation, il y a généralement plus de '
            'possibilités de paramètres à modifier pour adapter auxpatients. '
            'Les jeux sont souvent plus simples également.\n'
            '$tab$bullet Espace requis\n'
            '$tab$bullet Précautions\n'
            '$tab$bullet Équipement nécessaire\n'
            '$tab$bullet Coût\n'
            '\n'
            'Les informations qui se retrouvent pour chaque jeu sont les '
            'suivantes :\n'
            '$tab$bullet But\n'
            '$tab$bullet Durée\n'
            '$tab$bullet Position : assis, debout ou les deux\n'
            '$tab$bullet Nombre de joueur\n'
            '$tab$bullet Progression dans le jeu\n'
            '$tab$bullet Feedback de la performance : cette catégorie indique '
            'la façon que le joueur peut connaître sa performance de la tâche '
            'pendant qu\'il joue au jeu. Elle comprend l\'accumulation des '
            'points que le joueur voit à l\'écran, les commentaires auditifs ou '
            'les bruits de réussite ou d\'échec de la tâche et l\'avatar à '
            'l\'écran qui reproduit les mouvements du joueur en temps réel.\n'
            '$tab$bullet Feedback des résultats : cette catégorie indique '
            'comment le jeu affiche le résultat final de la performance du '
            'joueur. C\'est souvent cette catégorie qui peut être utilisée pour '
            'mettre dans le dossier du clinicien et qui indique s\'il y a eu '
            'amélioration de la tâche.\n'
            '$tab$bullet Exigences physiques minimales\n'
            '$tab$bullet Habiletés motrices\n'
            '$tab$bullet Considérations\n'
            '$tab$bullet Exigences cognitives\n',
      }[language]!;
  String get generalityRessourcesTitle => {
        'en': 'List of ressources',
        'fr': 'Liste de sources et ressources',
      }[language]!;
  String get generalityRessourcesText => {
        'en': 'To translate',
        'fr': '$tab$bullet Levac, Danielle, Stephanie Glegg, Heather Colquhoun, '
            'Patricia Miller, and Farzad Noubary. 2017. “Virtual Reality and '
            'Active Videogame-Based Practice, Learning Needs, and Preferences: '
            'A Cross-Canada Survey of Physical Therapists and Occupational '
            'Therapists.” Games for Health Journal 6(4):217–28. '
            'doi: 10.1089/g4h.2016.0089.\n'
            '$tab$bullet Levac, Danielle, Deborah Espy, Emily Fox, Sujata '
            'Pradhan, and Judith E. Deutsch. 2015. “‘Kinect-Ing’ with Clinicians: '
            'A Knowledge Translation Resource to Support Decision Making about Video '
            'Game Use in Rehabilitation.” Physical Therapy 95(3):426–40. '
            'doi: 10.2522/ptj.20130618.\n'
            '$tab$bullet Lino, Federica, Valentina Arcangeli, and Daniela Pia '
            'Rosaria Chieffo. 2021. “The Virtual Challenge: Virtual Reality Tools '
            'for Intervention in Children with Developmental Coordination '
            'Disorder.” Children 8(4).\n'
            '$tab$bullet Banerjee-Guénette, Priyanka, Sarah Bigford, and '
            'Stephanie M. N. Glegg. 2020. “Facilitating the Implementation of '
            'Virtual Reality-Based Therapies in Pediatric Rehabilitation.” '
            'Physical and Occupational Therapy in Pediatrics 40(2):201–16. '
            'doi: 10.1080/01942638.2019.1650867.\n'
            '$tab$bullet Levac, Danielle E., and Patricia A. Miller. 2013. '
            '“Integrating Virtual Reality Video Games into Practice: Clinicians’ '
            'Experiences.” Physiotherapy Theory and Practice 29(7):504–12. '
            'doi: 10.3109/09593985.2012.762078.\n'
            '$tab$bullet Lino, Federica, Valentina Arcangeli, and Daniela Pia '
            'Rosaria Chieffo. 2021. “The Virtual Challenge: Virtual Reality Tools '
            'for Intervention in Children with Developmental Coordination '
            'Disorder.” Children 8(4).\n'
            '$tab$bullet Galvin, Jane, and Danielle Levac. 2011. “Facilitating '
            'Clinical Decision-Making about the Use of Virtual Reality within '
            'Paediatric Motor Rehabilitation: Describing and Classifying Virtual '
            'Reality Systems.” Developmental Neurorehabilitation 14(2):112–22.\n'
            '\n'
            'Site web des consoles créées pour la réadaptation :\n'
            '$tab$bullet Site Web Habilup : https://ubique-site.com/\n'
            '$tab$bullet Site Web BootleBlast : https://pearlinteractives.com/\n'
            '$tab$bullet Site Web de Jintronix : https://jintronix.com/fr/',
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
