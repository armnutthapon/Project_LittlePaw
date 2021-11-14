import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Page_MyAppointment extends StatefulWidget {
  const Page_MyAppointment({Key key}) : super(key: key);

  @override
  _Page_MyAppointmentState createState() => _Page_MyAppointmentState();
}

class _Page_MyAppointmentState extends State<Page_MyAppointment> {
  List data;
  CalendarFormat format = CalendarFormat.month;
  String formattedDate;
  DateTime focusedDay = DateTime.now();

  getNotificationByID() async {
    // await Future.delayed(Duration(seconds: 2));
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User userId = auth.currentUser;
      final String uid = userId.uid;
      print("UID : ${uid}");

      http.Response response =
          await http.get(Uri.parse('$Url/appointment/notificationByID/$uid'));

      this.setState(() {
        data = json.decode(response.body);

        // formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
        //     .format(data[data.length - 1]['time_notification']);

        // aa =  DateFormat("dd-M-yyyy hh:mm:ss").parse(formattedDate);

        // aa =  DateFormat("dd-M-yyyy hh:mm:ss").parse(formattedDate);
      });
      // print(data[data.length - 1]['time_notification']);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
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
            "การนัดหมาย",
            style: TextStyle(
                fontSize: 22,
                color: Colors.red.shade300,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr'),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: data != null
            ? SingleChildScrollView(
                child: Column(children: [
                Container(
                    height: size.height * 0.8,
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: data.isEmpty
                          ? Center(
                              child: Text(
                              'ไม่มีการนัดหมาย',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              reverse: true,
                              itemCount: data == null ? 0 : data.length,
                              // ignore: missing_return
                              itemBuilder: (BuildContext context, int index) {
                                Color getColor() {
                                  if (data[index]['status'] == "Waiting") {
                                    return Colors.amber;
                                  } else if (data[index]['status'] ==
                                      "Confirmed") {
                                    // setState(() {
                                    //   formattedDate = DateFormat('dd-MM-yyyy').format(
                                    //       data[data.length - 1]['time_notification']);
                                    // });
                                    return Colors.green;
                                  } else if (data[index]['status'] ==
                                      "Denided") {
                                    // setState(() {
                                    //   formattedDate = DateFormat('dd-MM-yyyy').format(
                                    //       data[data.length - 1]['time_notification']);
                                    // });
                                    return Colors.red;
                                  }
                                }

                                // if (data[index]['status'] == "Waiting") {
                                return Container(
                                  height: size.height * 0.2,
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
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data[index]['pet_name'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Mitr'),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'สถานะ  :  ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'Mitr'),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: data[index]
                                                          ['status'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: getColor(),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Mitr'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data[index]['clinic_name'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Mitr'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'วันที่ : ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'Mitr'),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: data[index]['date'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Mitr'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'เวลา : ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'Mitr'),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: data[index]
                                                          ['time_appointment'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Mitr'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'อาการ : ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'Mitr'),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: data[index]
                                                          ['symptom'],
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
                                            ],
                                          ),
                                        ],
                                      )

                                      // Stack(
                                      //   children: <Widget>[
                                      //     Align(
                                      //       alignment: Alignment.topLeft,
                                      //       child: Text(
                                      //         data[index]['pet_name'],
                                      //         style: TextStyle(
                                      //             fontSize: 16,
                                      //             color: Colors.black,
                                      //             fontWeight: FontWeight.w500,
                                      //             fontFamily: 'Mitr'),
                                      //       ),
                                      //     ),
                                      //     Align(
                                      //       alignment: Alignment.centerLeft,
                                      //       child: Text(
                                      //         data[index]['symptom'],
                                      //         style: TextStyle(
                                      //             fontSize: 16,
                                      //             color: Colors.black,
                                      //             fontWeight: FontWeight.w300,
                                      //             fontFamily: 'Mitr'),
                                      //       ),
                                      //     ),
                                      //     Align(
                                      //       alignment: Alignment.bottomLeft,
                                      //       child: RichText(
                                      //         text: TextSpan(
                                      //           text: 'สถานะ  :  ',
                                      //           style: TextStyle(
                                      //               fontSize: 16,
                                      //               color: Colors.black,
                                      //               fontWeight: FontWeight.w300,
                                      //               fontFamily: 'Mitr'),
                                      //           children: <TextSpan>[
                                      //             TextSpan(
                                      //               text: data[index]['status'],
                                      //               style: TextStyle(
                                      //                   fontSize: 16,
                                      //                   color: getColor(),
                                      //                   fontWeight:
                                      //                       FontWeight.w500,
                                      //                   fontFamily: 'Mitr'),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Align(
                                      //       alignment: Alignment.bottomRight,
                                      //       child: Text(
                                      //         data[index]['clinic_name'],
                                      //         style: TextStyle(
                                      //             fontSize: 16,
                                      //             color: Colors.black,
                                      //             fontWeight: FontWeight.w500,
                                      //             fontFamily: 'Mitr'),
                                      //       ),
                                      //     ),
                                      //     Align(
                                      //       alignment: Alignment.topRight,
                                      //       child: Row(
                                      //           mainAxisSize: MainAxisSize.min,
                                      //           children: <Widget>[
                                      //             Text(
                                      //               data[index]
                                      //                   ['date_notification'],
                                      //               style: TextStyle(
                                      //                   fontSize: 14,
                                      //                   color: Colors.black,
                                      //                   fontWeight:
                                      //                       FontWeight.w400,
                                      //                   fontFamily: 'Mitr'),
                                      //             ),
                                      //             SizedBox(
                                      //               width: size.width * 0.01,
                                      //             ),
                                      //             Text(
                                      //               data[index]
                                      //                   ['time_notification'],
                                      //               style: TextStyle(
                                      //                   fontSize: 14,
                                      //                   color: Colors.black,
                                      //                   fontWeight:
                                      //                       FontWeight.w400,
                                      //                   fontFamily: 'Mitr'),
                                      //             ),
                                      //             SizedBox(
                                      //               width: size.width * 0.01,
                                      //             ),
                                      //             Icon(
                                      //               FontAwesomeIcons.clock,
                                      //               color: Colors.blue.shade800,
                                      //             )
                                      //           ]),
                                      //     ),
                                      //   ],
                                      // ),
                                      ),
                                );
                              }
                              // },
                              ),
                    ))
              ]))
            : Center(child: CircularProgressIndicator()));
  }
}
