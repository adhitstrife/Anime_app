import 'package:flutter/material.dart';
import 'package:anime_app/serivce/search_anime.dart';
import 'package:http/http.dart' as http;
import 'package:anime_app/models/anime_search_model.dart';
import 'package:anime_app/models/top_anime_model.dart';
import 'package:anime_app/component/popular_anime_card.dart';

class SearchScreen extends StatefulWidget {
  final String text;
  SearchScreen({Key key, @required this.text}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  Future<ResultAnime> futureResultAnime;

  void initState() {
    super.initState();
    futureResultAnime = searchAnime(http.Client(), widget.text);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SearchScreen(text: searchController.text)));
                },
                decoration: InputDecoration(
                    hintText: "Search Anime",
                    hintStyle:
                        TextStyle(color: Colors.grey[500].withOpacity(0.5)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: FutureBuilder(
                future: futureResultAnime,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.results.length,
                          itemBuilder: (context, index) {
                            TopList list = snapshot.data.results[index];
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  PopularWidget(list: list),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return SizedBox(
                      width: 30,
                      height: size.height * 0.2,
                      child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
