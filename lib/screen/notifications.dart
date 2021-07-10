import 'package:flutter/material.dart';

class notifications extends StatefulWidget {
  static const routeName = '/notifications';

  @override
  State<StatefulWidget> createState() {
    return _notificationsState();
  }
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('notifications Screen'),
        ],
      )),
    );
  }
}
