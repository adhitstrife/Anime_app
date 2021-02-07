import 'package:flutter/foundation.dart';
import 'top_anime_model.dart';

class ResultAnime {
  final String request_hash;
  final bool request_cached;
  final List<TopList> results;

  ResultAnime({this.request_hash, this.request_cached, this.results});

  factory ResultAnime.fromJson(Map<String, dynamic> json) {
    var listTop = json['results'] as List;
    List<TopList> animeList = listTop.map((i) => TopList.fromJson(i)).toList();
    return ResultAnime(
      request_hash: json['request_hash'],
      request_cached: json['request_cached'],
      results: animeList,
    );
  }
}
