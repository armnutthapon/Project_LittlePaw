import 'package:flutter/material.dart';

class Newfeed extends StatelessWidget {
  const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("News Feed"),
      ),
    );
  }
}
