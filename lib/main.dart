import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:anime_app/component/user_welcome.dart';
// import 'package:anime_app/component/anime_recomended_card.dart';
import 'package:anime_app/component/popular_anime_card.dart';
import 'package:anime_app/component/search_box.dart';
import 'package:http/http.dart';
import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/models/top_anime_model.dart';
import 'serivce/anime_service.dart';

void main() {
  runApp(MyApp());
}

void getAnime() async {
  Response response = await get('https://api.jikan.moe/v3/top/anime/');
  Map jsonResponse = json.decode(response.body);
  Anime anime = Anime.fromJson(jsonResponse);
  print(anime.request_cached);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Anime> futureAnime;

  @override
  void initState() {
    super.initState();
    loadAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Anime App',
      //     style: TextStyle(color: Colors.grey[500]),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      // ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'explore'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
            BottomNavigationBarItem(
                icon: Icon(Icons.portrait), label: 'account'),
          ]),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            UserWelcome(),
            SizedBox(
              height: 20,
            ),
            SearchBox(),
            SizedBox(
              height: 30,
            ),
            Text(
              "Anime Recomendation",
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 210,
              child: FutureBuilder(
                future: loadAnime(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(itemBuilder: (context, index) {
                        TopList list = snapshot.data.top[index];
                        return Column(
                          children: [Text("${list.rank}")],
                        );
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                },
              ),
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     AnimeRecomendedCard(),
              //     AnimeRecomendedCard(),
              //     AnimeRecomendedCard(),
              //     AnimeRecomendedCard(),
              //   ],
              // ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Populer",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            PopularWidgetCard(),
            PopularWidgetCard(),
            PopularWidgetCard(),
            PopularWidgetCard(),
          ],
        ),
      ),
    );
  }
}

class AnimeRecomendedCard extends StatelessWidget {
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
