import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';

class NotificationFeed extends StatefulWidget {
  static const routeName = '/notification';

  const NotificationFeed({Key key}) : super(key: key);

  @override
  _NotificationFeedState createState() => _NotificationFeedState();
}

class _NotificationFeedState extends State<NotificationFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "แจ้งเตือน นะจ๊ะ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        backgroundColor: Colors.blue.withOpacity(1),
        elevation: 10.0,
      ),
      body: ShowNotification(),
    );
  }
}

class ShowNotification extends StatefulWidget {
  const ShowNotification({Key key}) : super(key: key);

  @override
  _ShowNotificationState createState() => _ShowNotificationState();
}

class _ShowNotificationState extends State<ShowNotification> {
  List data;

  getNotificationByID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;

    http.Response response = await http.get(Uri.parse(
        'https:littlepaw.herokuapp.com/appointment/notificationByID/$uid'));

    this.setState(() {
      data = json.decode(response.body);
    });
    print(uid);
    print(data[0]);
    return data;
  }

  getNoti() async {
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User userId = await auth.currentUser;
    final String uid = await userId.uid;
    http.Response response =
        await http.get(Uri.parse('$Url/appointment/notificationByID/$uid'));

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data);
    print(Url);

    return print("ID    " + uid);
  }

  @override
  void initState() {
    super.initState();
    getNoti();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container();
  }
}
