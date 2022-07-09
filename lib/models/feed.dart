import 'package:uplisten/models/audiobook_short.dart';

class AudiobookShortList {
  final List<AudiobookShort> books;

  AudiobookShortList({
    required this.books,
  });

  factory AudiobookShortList.fromJson(List<dynamic> json) {
    List<AudiobookShort> books = <AudiobookShort>[];

    books = json.map((d) => AudiobookShort.fromJson(d)).toList();

    return AudiobookShortList(
      books: books,
    );
  }
}
