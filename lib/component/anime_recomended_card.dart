import 'package:flutter/material.dart';
import 'package:anime_app/models/anime_model.dart';

class AnimeRecomendedCard extends StatelessWidget {
  final List<Anime> anime;

  const AnimeRecomendedCard({
    Key key, this.anime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset('assets/images/tiny.jpg')),
          SizedBox(
            height: 10,
          ),
          Text(
            "Cowboy Bebop",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.yellow[400],
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '480',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[400],
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
