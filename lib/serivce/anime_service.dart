import 'package:anime_app/models/anime_model.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

Future<Anime> loadAnime() async {
  Response response = await get('https://api.jikan.moe/v3/top/anime/');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final jsonResponse = jsonDecode(response.body);
    return Anime.fromJson(jsonResponse);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  
}
