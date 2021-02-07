import 'package:anime_app/Screen/detail.dart';
import 'package:anime_app/Screen/search.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/component/user_welcome.dart';
import 'package:anime_app/component/anime_recomended_card.dart';
import 'package:anime_app/component/popular_anime_card.dart';
import 'package:anime_app/component/search_box.dart';
import 'package:http/http.dart' as http;
import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/models/top_anime_model.dart';
import 'serivce/anime_service.dart';
import 'serivce/popular_item_service.dart';

void main() {
  runApp(MyApp());
}

// void getAnime() async {
//   Response response = await get('https://api.jikan.moe/v3/top/anime/');
//   Map jsonResponse = json.decode(response.body);
//   Anime anime = Anime.fromJson(jsonResponse);
//   print(anime.request_cached);
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      initialRoute: '/',
      routes: {
        '/detail': (context) => DetailPage(),
        '/search': (context) => SearchScreen()
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Anime> futureAnime;
  Future<Anime> topItem;
  @override
  void initState() {
    super.initState();
    futureAnime = loadAnime(http.Client());
    topItem = loadPopularItem(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          shrinkWrap: true,
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
              "Top Anime TV",
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.4 - 30,
              child: FutureBuilder(
                future: futureAnime,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.top.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            TopList list = snapshot.data.top[index];
                            return Row(
                              children: [AnimeRecomendedCard(list: list)],
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
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
            Container(
              child: FutureBuilder(
                future: topItem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.top.length,
                          itemBuilder: (context, index) {
                            TopList list = snapshot.data.top[index];
                            return Column(
                              children: [
                                PopularWidget(list: list),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
