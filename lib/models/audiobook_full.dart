import 'package:uplisten/models/reader.dart';
import 'package:uplisten/models/author.dart';
import 'package:uplisten/models/audio.dart';

class AudiobookFull {
  final String id;
  final String title;
  final String description;
  final String language;
  final String totalTime;
  final String numSections;

  final List<Author> authors;
  final List<Reader> readers;
  final List<Audio> audio;

  AudiobookFull({
    required this.id,
    required this.title,
    required this.description,
    required this.language,
    required this.totalTime,
    required this.numSections,
    required this.authors,
    required this.readers,
    required this.audio,
  });

  factory AudiobookFull.fromJson(Map<String, dynamic> json) {
    print(json['audio']);
    var aList = json['authors'] as List;
    List<Author> authorList = aList
        .cast<Map<String, dynamic>>()
        .map((d) => Author.fromJson(d))
        .toList();

    var rList = json['readers'] as List;
    List<Reader> readerList = rList
        .cast<Map<String, dynamic>>()
        .map((d) => Reader.fromJson(d))
        .toList();

    var auList = json['audio'] as List;
    List<Audio> audioList = auList
        .cast<Map<String, dynamic>>()
        .map((d) => Audio.fromJson(d))
        .toList();

    return AudiobookFull(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      language: json['language'],
      totalTime: json['total_time'],
      numSections: json['num_sections'],
      authors: authorList,
      readers: readerList,
      audio: audioList,
    );
  }
}
