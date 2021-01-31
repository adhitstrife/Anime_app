import 'package:flutter/material.dart';

class PopularWidgetCard extends StatelessWidget {
  const PopularWidgetCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset('assets/images/tiny.jpg')),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cowboy Bebop",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                '4.5',
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
                    Container(
                      width: 200,
                      child: Text(
                          "In the year 2071, humanity has colonoized several of the planets and moons..."),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Action, ',
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[400]),
                        ),
                        Text(
                          'Adventure',
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[400]),
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
    );
  }
}
