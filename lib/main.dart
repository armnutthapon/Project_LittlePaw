import 'package:flutter/material.dart';
import 'package:persistent_bottom/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red.shade400,
      ),
      home: App(),
    );
  }
}
