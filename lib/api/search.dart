import 'dart:convert';
import 'package:http/http.dart';

import 'package:uplisten/models/feed.dart';
import 'package:uplisten/utils/constants.dart';

Future<AudiobookShortList> querySearchAPI(String query, {int limit: 10}) async {
  final response = await get(
      Uri.parse("$apiurl/search?limit=$limit&q=$query"));

  if (response.statusCode == 200) {
    return AudiobookShortList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("HTTP Error");
  }
}
