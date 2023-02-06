import 'package:flutter/material.dart';

abstract class Option {
  const Option(this.name, {this.choice});

  final String name;
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
  String get name => _list.isNotEmpty ? _list[0].name : "";

  OptionList() : _list = [];
  List<int> toInt() => _list.map<int>((e) => e.serialize()!).toList();

  List<int?> serialize() => _list.map<int?>((e) => e.serialize()).toList();
  OptionList.deserialize(List<dynamic> item, factories)
      : _list = item.map<T>((e) => factories(choice: e)).toList();

  T operator [](value) => _list[value];
  @override
  Iterator<T> get iterator => _list.iterator;

  void add(element) => _list.add(element);
  void remove(element) => _list.remove(element);
  void clear() => _list.clear();
}
