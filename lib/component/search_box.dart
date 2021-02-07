import 'package:flutter/material.dart';
import 'package:anime_app/Screen/search.dart';

class SearchBox extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[100],
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
            hintStyle: TextStyle(color: Colors.grey[500].withOpacity(0.5)),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
