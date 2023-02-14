import 'package:flutter/material.dart';

class Author {
  const Author({
    required this.firstName,
    required this.lastName,
    this.middleName,
  });

  final String firstName;
  final String? middleName;
  final String lastName;

  @override
  String toString() {
    return '$lastName, '
        '${firstName[0]}.'
        '${middleName != null ? '${middleName![0]}.' : ''}';
  }
}

class Citation {
  const Citation({
    required this.authors,
    required this.year,
    required this.title,
    required this.journal,
    required this.volume,
    this.issue,
    this.pages,
    this.doi,
  });

  final List<Author> authors;
  final int year;
  final String title;
  final String journal;
  final int volume;
  final int? issue;
  final List<int>? pages;
  final String? doi;

  Widget get toWidget {
    String authors = '';
    for (int i = 0; i < this.authors.length; i++) {
      authors += this.authors[i].toString();
      if (i != this.authors.length - 1) {
        authors += i == this.authors.length - 2 ? ' & ' : ', ';
      }
    }

    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: authors, style: const TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' ($year)'),
      TextSpan(text: ', "$title",'),
      TextSpan(
          text: ' $journal',
          style: const TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: ', $volume'),
      if (issue != null) TextSpan(text: '($issue)'),
      if (pages == null) const TextSpan(text: '.'),
      if (pages != null)
        TextSpan(
            text: pages!.length == 1
                ? ':${pages![0]}.'
                : ':${pages!.first}-${pages!.last}.'),
      if (doi != null) TextSpan(text: ' DOI: $doi'),
    ]));
  }
}
