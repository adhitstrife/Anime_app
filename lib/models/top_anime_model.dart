import 'dart:ffi';

import 'package:flutter/foundation.dart';

class TopList {
  final int rank;
  final String title;
  final String image_url;
  final String type;
  final String date;
  final int episodes;
  final num score;

  TopList(
      {this.rank,
      this.title,
      this.image_url,
      this.type,
      this.date,
      this.score,
      this.episodes});

  factory TopList.fromJson(Map<String, dynamic> json) {
    return TopList(
        rank: json['rank'] as int,
        title: json['title'] as String,
        image_url: json['image_url'] as String,
        type: json['type'] as String,
        date: json['start_date'] as String,
        episodes: json['episodes'] as int,
        score: json['score']);
  }
}
