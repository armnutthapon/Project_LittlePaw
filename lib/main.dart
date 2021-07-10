import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:little_paw/app.dart';
import 'package:little_paw/login.dart';
=======
import 'package:persistent_bottom/app.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'dart:convert';
import 'server.dart';
>>>>>>> parent of ead7177 (login page)

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
