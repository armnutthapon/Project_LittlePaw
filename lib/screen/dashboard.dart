import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/database/database.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  // const Newfeed({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;
  var appointment;
  String sum_appointment;

  getDashboard() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User userId = auth.currentUser;
      final String uid = userId.uid;
      http.Response response =
          await http.get(Uri.parse('$Url/owner/showByID/$uid'));
      setState(() {
        data = json.decode(response.body);
      });
      return data;
    } catch (e) {
      print(e);
    }
  }

  getAppointmentCount() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User userId = auth.currentUser;
      final String uid = userId.uid;
      http.Response response =
          await http.get(Uri.parse('$Url/appointment/countbyuid/$uid'));
      setState(() {
        appointment = json.decode(response.body);
        if (response.body == null) {
          appointment = 0;
        } else {
          appointment = json.decode(response.body);
        }
      });
      print(appointment);
      return appointment;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDashboard();
    getAppointmentCount();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("กระดานข้อมูล",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr')),
          backgroundColor: Colors.white.withOpacity(1),
          elevation: 0,
        ),
        body: data != null
            ? Container(
                padding: EdgeInsets.all(10),
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: size.height * 0.15,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade300.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.blue.shade300,
                                    child: ClipOval(
                                        child: SizedBox(
                                      child: Icon(
                                        Icons.pets,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "จำนวนสัตว์เลี้ยง : ",
                                  style: TextStyle(
                                      color: Colors.blue.shade300,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                Text(
                                  "${data['pet_id'].length}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        height: size.height * 0.15,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.shade300.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.pink.shade300,
                                    child: ClipOval(
                                        child: SizedBox(
                                      height: 50,
                                      child: Icon(
                                        FontAwesomeIcons.bookMedical,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ))),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "จำนวนการทำนัดทั้งหมด :",
                                  style: TextStyle(
                                      color: Colors.pink.shade300,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                Text(
                                  '${appointment}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
