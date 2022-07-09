import 'author.dart';

class AudiobookShort {
  final String id;
  final String title;
  final String description;
  final String language;
  final String totalTime;
  final String numSections;

  final List<Author> authors;

  AudiobookShort({
    required this.id,
    required this.title,
    required this.description,
    required this.language,
    required this.totalTime,
    required this.numSections,
    required this.authors,
  });

  factory AudiobookShort.fromJson(Map<String, dynamic> json) {
    var list = json['authors'] as List;

    List<Author> authorList = list
        .cast<Map<String, dynamic>>()
        .map((d) => Author.fromJson(d))
        .toList();

    return AudiobookShort(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      language: json['language'],
      totalTime: json['total_time'],
      numSections: json['num_sections'],
      authors: authorList,
    );
  }
}
