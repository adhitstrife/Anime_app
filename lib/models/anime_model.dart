import 'package:flutter/foundation.dart';
import 'top_anime_model.dart';

class Anime {
  final String request_hash;
  final bool request_cached;
  final List<TopList> top;

  Anime({this.request_hash, this.request_cached, this.top});

  factory Anime.fromJson(Map<String, dynamic> json) {
    var listTop = json['top'] as List;
    List<TopList> animeList = listTop.map((i) => TopList.fromJson(i)).toList();
    return Anime(
      request_hash: json['request_hash'],
      request_cached: json['request_cached'],
      top: animeList,
    );
  }
}
