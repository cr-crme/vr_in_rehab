import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleText with ChangeNotifier {
  LocaleText({required this.language});

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

  String get appSelectedOptions => {
        'en': 'Here are the selected options',
        'fr': 'Voici les options sélectionnées'
      }[language]!;

  String get appTitle =>
      {'en': 'Decide your VR game', 'fr': 'Choisi ton jeu RV'}[language]!;
  String get appProposedGames => {
        'en': 'Here a selection of games',
        'fr': 'Voici une sélection de jeux'
      }[language]!;
  String get all => {'en': 'All', 'fr': 'Tous'}[language]!;

  String get age => {'en': 'Age', 'fr': 'Âge'}[language]!;
  String get young => {'en': 'Young', 'fr': 'Jeune'}[language]!;
  String get old => {'en': 'Old', 'fr': 'Vieux'}[language]!;

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

  String get sittingAbility =>
      {'en': 'Sitting Ability', 'fr': 'Capacité d\'assise'}[language]!;
  String get standingAbility =>
      {'en': 'Standing Ability', 'fr': 'Capacité de support'}[language]!;
  String get dynamicWithSupport =>
      {'en': 'Dynamic with support', 'fr': 'Avec support dynamique'}[language]!;
  String get dynamicNoSupport => {
        'en': 'Dynamic without support',
        'fr': 'Sans support dynamique'
      }[language]!;
  String get staticWithSupport =>
      {'en': 'Static with support', 'fr': 'Avec support statique'}[language]!;
  String get staticNoSupport => {
        'en': 'Static without support',
        'fr': 'Sans support statique'
      }[language]!;

  String get gameGoal =>
      {'en': 'Game use goal', 'fr': 'But de l\'utilisation'}[language]!;
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

  String get bootleBlast =>
      {'en': 'BootleBlast', 'fr': 'BootleBlast'}[language]!;
  String get jintronix => {'en': 'Jintronix', 'fr': 'Jintronix'}[language]!;
  String get habilup => {'en': 'Habilup', 'fr': 'Habilup'}[language]!;
  String get xbox => {'en': 'XBox', 'fr': 'XBox'}[language]!;
  String get nintendoSwitch =>
      {'en': 'Nintendo Switch', 'fr': 'Nintendo Switch'}[language]!;
  String get oculus => {'en': 'Oculus', 'fr': 'Oculus'}[language]!;
  String get vive => {'en': 'Vive', 'fr': 'Vive'}[language]!;

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
  String get performance => {
        'en': 'Knowledge of performance',
        'fr': 'Connaissance de la performance'
      }[language]!;
  String get result => {
        'en': 'Knowledge of results',
        'fr': 'Connaissance des résultats'
      }[language]!;
  String get physical =>
      {'en': 'Physical requirements', 'fr': 'Exigences physiques'}[language]!;
}
