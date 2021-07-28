import 'package:flutter/material.dart';

class Newfeed extends StatelessWidget {
  const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ข่าว นะจ๊ะ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        backgroundColor: Colors.white.withOpacity(1),
        elevation: 10.0,
      ),
    );
  }
}
