import 'package:flutter/material.dart';

abstract class Option {
  const Option({this.choice});

  final int? choice;
  int? serialize() => choice;

  String title(BuildContext context, {bool listen = true});
  static List<Option> get allChoices => throw "Not implemented for that option";

  @override
  bool operator ==(covariant Option other) {
    return runtimeType == other.runtimeType && other.choice == choice;
  }

  @override
  int get hashCode => choice.hashCode;
}

class OptionList<T extends Option> extends Iterable<T> {
  final List<T> _list;
  List<int?> serialize() => _list.map<int?>((e) => e.serialize()).toList();
  OptionList.deserialize(List<dynamic> item, factories)
      : _list = item.map<T>((e) => factories(choice: e)).toList();

  T operator [](value) => _list[value];
  @override
  Iterator<T> get iterator => _list.iterator;
}
