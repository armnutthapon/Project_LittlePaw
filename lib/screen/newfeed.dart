import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Newfeed extends StatelessWidget {
  const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข่าว",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr')),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
          ),
        ],
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 10.0, //No shadow
      ),
    );
  }
}
