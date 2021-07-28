import 'package:flutter/material.dart';

class Newfeed extends StatelessWidget {
  const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "ข่าว นะจ๊ะ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        backgroundColor: Colors.green.withOpacity(1),
        elevation: 10.0,
      ),
    );
  }
}
