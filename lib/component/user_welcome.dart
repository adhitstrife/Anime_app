import 'package:flutter/material.dart';

class UserWelcome extends StatelessWidget {
  const UserWelcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Halo Adhitya",
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold));
  }
}
