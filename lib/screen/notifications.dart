import 'package:flutter/material.dart';

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
    );
  }
}
