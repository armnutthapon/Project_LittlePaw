import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:http/http.dart' as http;

class Newfeed extends StatelessWidget {
  // const Newfeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ImagePickerExample(),
    );
  }
}

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key key}) : super(key: key);

  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  var data;
  var appointment;
  String sum_appointment;
  getDashboard() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;
    http.Response response =
        await http.get(Uri.parse('$Url/owner/showByID/$uid'));
    setState(() {
      data = json.decode(response.body);
    });
    return data;
  }

  getNotificationByID() async {
    FirebaseAuth auth = await FirebaseAuth.instance;
    User userId = await auth.currentUser;
    String uid = await userId.uid;

    http.Response response =
        await http.get(Uri.parse('$Url/appointment/notificationByID/$uid'));

    this.setState(() {
      appointment = json.decode(response.body);
      if (appointment == []) {
        sum_appointment = '0';
      } else {
        sum_appointment = '${appointment.length}';
      }
    });
    print("count : ${appointment.length}");
    return appointment;
  }

  @override
  void initState() {
    super.initState();
    getDashboard();
    getNotificationByID();
  }

  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final loginProvider = Provider.of<AuthServices>(context);
    return data != null
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
                          color: Colors.green.shade300.withOpacity(0.2),
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
                                backgroundColor: Colors.green.shade300,
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
                              "จำนวนการรักษา :",
                              style: TextStyle(
                                  color: Colors.green.shade300,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Mitr'),
                            ),
                            Text(
                              "30",
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
                          color: Colors.amber.shade600.withOpacity(0.2),
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
                                backgroundColor: Colors.amber.shade600,
                                child: ClipOval(
                                    child: SizedBox(
                                  height: 50,
                                  child: Icon(
                                    FontAwesomeIcons.calendarCheck,
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
                              "จำนวนการนัด : ",
                              style: TextStyle(
                                  color: Colors.amber.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Mitr'),
                            ),
                            Text(
                              "1",
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
        : Center(child: CircularProgressIndicator());
  }
}

//  Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               child: Text(
//                 "ออกจากระบบ",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Mitr'),
//               ),
//               onPressed: () async => await loginProvider.logout(),
//             ),
//             IconButton(
//                 onPressed: () async => await loginProvider.logout(),
//                 icon: Icon(Icons.exit_to_app)),
//           ],
//         ),
