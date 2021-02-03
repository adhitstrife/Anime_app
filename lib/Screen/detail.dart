import 'package:flutter/material.dart';

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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            'assets/images/small.jpg',
                            width: 200,
                          )),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.orange[800],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "#1",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 55,
                    top: 255,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent[700],
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
                child: Text(
                  "In the year 2071, humanity has colonized several of the planets and moons of the solar system leaving the now uninhabitable surface of planet Earth behind. The Inter Solar System Police attempts to keep peace in the galaxy, aided in part by outlaw bounty hunters, referred to as \"Cowboys.\" The ragtag team aboard the spaceship Bebop are two such individuals. Mellow and carefree Spike Spiegel is balanced by his boisterous, pragmatic partner Jet Black as the pair makes a living chasing bounties and collecting rewards. Thrown off course by the addition of new members that they meet in their travels\u2014Ein, a genetically engineered, highly intelligent Welsh Corgi; femme fatale Faye Valentine, an enigmatic trickster with memory loss; and the strange computer whiz kid Edward Wong\u2014the crew embarks on thrilling adventures that unravel each member's dark and mysterious past little by little. Well-balanced with high density action and light-hearted comedy, Cowboy Bebop is a space Western classic and an homage to the smooth and improvised music it is named after. [Written by MAL Rewrite]",
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}
