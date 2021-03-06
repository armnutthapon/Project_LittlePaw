import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class NotificationFeed extends StatefulWidget {
  static const routeName = '/notification';

  const NotificationFeed({Key key}) : super(key: key);

  @override
  _NotificationFeedState createState() => _NotificationFeedState();
}

class _NotificationFeedState extends State<NotificationFeed> {
  List data;
  CalendarFormat format = CalendarFormat.month;
  String formattedDate;
  DateTime focusedDay = DateTime.now();

  getNotificationByID() async {
    try {
      FirebaseAuth auth = await FirebaseAuth.instance;
      User userId = await auth.currentUser;
      String uid = await userId.uid;

      http.Response response =
          await http.get(Uri.parse('$Url/appointment/notificationByID/$uid'));

      this.setState(() {
        data = json.decode(response.body);
      });
      return data;
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getNotificationByID();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "แจ้งเตือน",
            style: TextStyle(
                fontSize: 22,
                color: Colors.red.shade300,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mitr'),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: data != null
            ? SingleChildScrollView(
                child: Column(children: [
                Container(
                    color: Colors.white,
                    height: size.height * 0.8,
                    child: data.isEmpty
                        ? Center(
                            child: Text(
                            'ไม่มีการแจ้งเตือน',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Mitr'),
                          ))
                        : ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: data == null ? 0 : data.length,
                            // ignore: missing_return
                            itemBuilder: (BuildContext context, int index) {
                              Color getColor() {
                                if (data[index]['status'] == "Waiting") {
                                  return Colors.amber;
                                } else if (data[index]['status'] ==
                                    "Confirmed") {
                                  return Colors.green;
                                } else if (data[index]['status'] == "Denided") {
                                  return Colors.red;
                                }
                              }

                              if (data[index]['status'] == "Confirmed" ||
                                  data[index]['status'] == "Denided") {
                                return Container(
                                  height: size.height * 0.17,
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(2,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            data[index]['pet_name'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Mitr'),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'คลินิก  :  ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: 'Mitr'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: data[index]
                                                      ['clinic_name'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'Mitr'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'สถานะ  :  ',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: 'Mitr'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: data[index]['status'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: getColor(),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Mitr'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  data[index]
                                                      ['date_notification'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Mitr'),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                Text(
                                                  data[index]
                                                      ['time_notification'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Mitr'),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                Icon(
                                                  FontAwesomeIcons.clock,
                                                  color: Colors.blue.shade800,
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                // print("Waiting");
                              }
                            },
                          ))
              ]))
            : Center(child: CircularProgressIndicator()));
  }
}
