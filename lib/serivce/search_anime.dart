import 'package:anime_app/models/anime_search_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Map<String, dynamic> _decode(String jsonString) {
  return jsonDecode(jsonString);
}

Future<ResultAnime> searchAnime(http.Client client, String str) async {
  final response = await client
      .get('https://api.jikan.moe/v3/search/anime?q=' + str + '&page=1');
  print(response);
  // return parseAnime(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> result = await compute(_decode, response.body);
    // final jsonResponse = jsonDecode(response.body);
    return ResultAnime.fromJson(result);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load resource');
  }
}
