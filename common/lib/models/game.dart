import 'dart:convert';

import 'package:common/common.dart';
import 'package:enhanced_containers/enhanced_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Game extends ItemSerializable {
  final String title;
  final String collection;
  final String console;
  final String? thumbnailPath;

  // Information about the game
  final Map<String, String> _description;
  final Map<String, String> _time;
  final Map<String, String> _position;
  final Map<String, String> _numberPlayers;
  final Map<String, String> _progression;
  final Map<String, String> _performanceFeedback;
  final Map<String, String> _resultsFeedback;
  final Map<String, String> _physicalRequirements;
  final Map<String, String> _motorSkills;
  final Map<String, String> _sideNotes;
  final Map<String, String> _cognitiveRequirements;

  // Decision algorithm elements
  final Map<Type, OptionList> decisionOptions;

  Game.fromSerialized(Map<String, dynamic> map)
      : title = map['title'],
        collection = map['collection'],
        console = map['console'],
        thumbnailPath = map['imagePath'] != null
            ? '$rootAssetsPath/images/games/${map['imagePath']}'
            : null,
        _description = map['information']['description'].cast<String, String>(),
        _time = map['information']['time'].cast<String, String>(),
        _position = map['information']['position'].cast<String, String>(),
        _numberPlayers =
            map['information']['numberPlayers'].cast<String, String>(),
        _progression = map['information']['progression'].cast<String, String>(),
        _performanceFeedback =
            map['information']['performanceFeedback'].cast<String, String>(),
        _resultsFeedback =
            map['information']['resultsFeedback'].cast<String, String>(),
        _physicalRequirements =
            map['information']['physicalRequirements'].cast<String, String>(),
        _motorSkills = map['information']['motorSkills'].cast<String, String>(),
        _sideNotes = map['information']['sideNotes'].cast<String, String>(),
        _cognitiveRequirements =
            map['information']['cognitiveRequirements'].cast<String, String>(),
        decisionOptions = {
          UpperExtremity: OptionList<UpperExtremity>.deserialize(
            map['filter'][UpperExtremity.optionName],
            UpperExtremity.from,
          ),
          LowerExtremity: OptionList<LowerExtremity>.deserialize(
            map['filter'][LowerExtremity.optionName],
            LowerExtremity.from,
          ),
          Contraindications: OptionList<Contraindications>.deserialize(
            map['filter'][Contraindications.optionName],
            Contraindications.from,
          ),
          GameGoal: OptionList<GameGoal>.deserialize(
            map['filter'][GameGoal.optionName],
            GameGoal.from,
          ),
          GameLength: OptionList<GameLength>.deserialize(
            map['filter'][GameLength.optionName],
            GameLength.from,
          ),
          Difficulty: OptionList<Difficulty>.deserialize(
              map['filter'][Difficulty.optionName], Difficulty.from),
          CanSave: OptionList<CanSave>.deserialize(
              map['filter'][CanSave.optionName], CanSave.from),
        };

  @override
  Map<String, dynamic> serializedMap() {
    return {
      'title': title,
      'collection': collection,
      'console': console,
      'information': {
        'description': _description,
        'time': _time,
        'position': _position,
        'numberPlayers': _numberPlayers,
        'progression': _progression,
        'performanceFeedback': _performanceFeedback,
        'resultsFeedback': _resultsFeedback,
        'physicalRequirements': _physicalRequirements,
        'motorSkills': _motorSkills,
        'sideNotes': _sideNotes,
        'cognitiveRequirements': _cognitiveRequirements,
      },
      'filter': decisionOptions.map(
        (key, value) => MapEntry(
            decisionOptions[key]!.name, decisionOptions[key]!.serialize()),
      ),
    };
  }

  String description(BuildContext context) =>
      _description[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String time(BuildContext context) =>
      _time[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String position(BuildContext context) =>
      _position[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String numberPlayers(BuildContext context) =>
      _numberPlayers[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String progression(BuildContext context) =>
      _progression[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String performanceFeedback(BuildContext context) =>
      _performanceFeedback[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String resultsFeedback(BuildContext context) =>
      _resultsFeedback[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String physicalRequirements(BuildContext context) =>
      _physicalRequirements[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String motorSkills(BuildContext context) =>
      _motorSkills[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String sideNotes(BuildContext context) =>
      _sideNotes[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
  String cognitiveRequirements(BuildContext context) =>
      _cognitiveRequirements[LocaleText.of(context).language] ??
      LocaleText.of(context).informationNotAvailable;
}

Future<List<Game>> readGames() async {
  const jsonPath = '$rootAssetsPath/json/all_games.json';

  final input = await http.get(Uri.parse(jsonPath));
  Map<String, dynamic> map = jsonDecode(input.body);
  List<Game> out = [];
  for (final game in map.keys) {
    out.add(Game.fromSerialized(map[game]));
  }
  return out;
}
