import 'package:anime_app/models/top_anime_model.dart';
import 'package:flutter/material.dart';

class AnimeRecomendedCard extends StatelessWidget {
  final TopList list;

  AnimeRecomendedCard({this.list});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(list.image_url,
                    height: size.height * 0.3 - 30)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 120,
              height: 25,
              child: Text(
                list.title,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
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
                        Icons.star,
                        color: Colors.yellow[400],
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        list.score.toString(),
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
                        Icons.calendar_today,
                        color: Colors.yellow[400],
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        list.date,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
