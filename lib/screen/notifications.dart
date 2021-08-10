import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:little_paw/database/database.dart';

import 'clinic/component/clinic_clinicCard.dart';

class NotificationFeed extends StatefulWidget {
  static const routeName = '/notification';

  const NotificationFeed({Key key}) : super(key: key);

  @override
  _NotificationFeedState createState() => _NotificationFeedState();
}

class _NotificationFeedState extends State<NotificationFeed> {
  List data;
  var _id;
  getClinic() async {
    http.Response response = await http.get(Uri.parse('$Url/clinic'));

    this.setState(() {
      data = json.decode(response.body);
    });

    return data;
  }

  deleteClinic() async {
    http.Response response = await http.delete(Uri.parse('$Url/clinic/deleteClinic/$_id'));
    print("Delete Clinic By " + _id);
  }

  @override
  void initState() {
    super.initState();
    getClinic();
  }

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
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            // print(data[index]['_id']);
            return ListTile(
              title: Text(
                data[index]['clinic_name'],
                style: TextStyle(
                  fontFamily: 'Mitr',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: IconButton(
          icon: Icon(FontAwesomeIcons.trashAlt),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              _id = data[index]['_id'];
              data.removeAt(index);
            });
            print(_id);
            deleteClinic();
          },
        ),
            );
          }),
    );
  }
}
