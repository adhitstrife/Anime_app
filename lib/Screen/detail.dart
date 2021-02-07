import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readmore/readmore.dart';

final List<String> imgList = [
  'https://media.kitsu.io/anime/poster_images/1/small.jpg?1597604210',
  'https://media.kitsu.io/anime/poster_images/2/small.jpg?1597604210',
  'https://media.kitsu.io/anime/poster_images/3/small.jpg?1597604210'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
          child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                'assets/images/small.jpg',
                width: 200,
              )),
          Positioned(
            right: 0,
            bottom: 15,
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
              height: 40,
              width: 40,
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    )
    .toList();

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ListView(
            children: [
              ImageCard(),
              SizedBox(
                height: size.height * 0.2 - 100,
              ),
              Center(
                child: Text(
                  "Cowboy Bebop",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ReadMoreText(
                  "In the year 2071, humanity has colonized several of the planets and moons of the solar system leaving the now uninhabitable surface of planet Earth behind. The Inter Solar System Police attempts to keep peace in the galaxy, aided in part by outlaw bounty hunters, referred to as \"Cowboys.\" The ragtag team aboard the spaceship Bebop are two such individuals. Mellow and carefree Spike Spiegel is balanced by his boisterous, pragmatic partner Jet Black as the pair makes a living chasing bounties and collecting rewards. Thrown off course by the addition of new members that they meet in their travels\u2014Ein, a genetically engineered, highly intelligent Welsh Corgi; femme fatale Faye Valentine, an enigmatic trickster with memory loss; and the strange computer whiz kid Edward Wong\u2014the crew embarks on thrilling adventures that unravel each member's dark and mysterious past little by little. Well-balanced with high density action and light-hearted comedy, Cowboy Bebop is a space Western classic and an homage to the smooth and improvised music it is named after. [Written by MAL Rewrite]",
                  trimLines: 4,
                  colorClickableText: Colors.orange,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(fontSize: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "8.2",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[600]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Score")
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "4.1k",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Have Seen")
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "2.1k",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Want See")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class ImageCard extends StatefulWidget {
  const ImageCard({
    Key key,
  }) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            height: size.height * 0.4 + 10,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: _current == index ? 20.0 : 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
                color: _current == index
                    ? Colors.orange
                    : Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.circular(20.0)),
          );
          // : Container(
          //     width: 8.0,
          //     height: 8.0,
          //     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Color.fromRGBO(0, 0, 0, 0.4),
          //     ),
          //   );
        }).toList(),
      )
    ]);
  }
}
