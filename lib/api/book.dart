import 'dart:convert';
import 'package:http/http.dart';

import 'package:uplisten/models/audiobook_full.dart';
import 'package:uplisten/utils/constants.dart';

Future<AudiobookFull> fetchBook(int id) async {
  final response =
      await get(Uri.parse("$apiurl/book?id=$id"));

  if (response.statusCode == 200) {
    return AudiobookFull.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("HTTP Error");
  }
}
