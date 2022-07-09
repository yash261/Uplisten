import 'dart:convert';
import 'package:http/http.dart';

import 'package:uplisten/models/feed.dart';

Future<AudiobookShortList> fetchFeed(String url, {int limit: 10}) async {
  final response = await get(Uri.parse("$url?limit=$limit"));

  if (response.statusCode == 200) {
    return AudiobookShortList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("HTTP Error!");
  }
}
