import 'package:flutter/material.dart';
import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/models/top_anime_model.dart';

class PopularWidgetCard extends StatelessWidget {
  final Anime data;

  PopularWidgetCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PopularWidget extends StatelessWidget {
  final TopList list;

  PopularWidget({this.list});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.network(
                        list.image_url,
                        height: size.height * 0.3 - 30,
                      )),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170,
                        child: Text(
                          list.title,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
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
                          SizedBox(
                            width: 12,
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
                                  list.score.toString(),
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Action, ',
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                          ),
                          Text(
                            'Adventure',
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
