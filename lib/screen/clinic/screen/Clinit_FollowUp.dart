import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/mypet/component/mypet_petInfo.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class FollowUp_Page extends StatefulWidget {
  const FollowUp_Page({Key key}) : super(key: key);

  @override
  _FollowUp_PageState createState() => _FollowUp_PageState();
}

class _FollowUp_PageState extends State<FollowUp_Page> {
  var data;

  void initState() {
    super.initState();
    getFollowUp();
  }

  getFollowUp() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User userId = auth.currentUser;
      final String uid = userId.uid;

      http.Response response =
          await http.get(Uri.parse('$Url/medical/showfollowupbyuid/$uid'));

      this.setState(() {
        data = json.decode(response.body);
      });

      return data;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        data != null
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.white,
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
                            itemCount: data == null ? 0 : data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 3,
                                  child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'สัตว์เลี้ยง  :  ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontFamily: 'Mitr'),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: data[index]
                                                            ['pet_name'],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Mitr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'คลินิก  :  ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontFamily: 'Mitr'),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            "${data[index]['clinic_name']} ",
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
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'อาการ  :  ',
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  text: TextSpan(
                                                    text:
                                                        'วันที่เข้ารักษา  :  ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontFamily: 'Mitr'),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: data[index]
                                                            ['date'],
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
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                  text: TextSpan(
                                                    text:
                                                        'วันที่นัดติดตามอาการ  :  ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontFamily: 'Mitr'),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: data[index]
                                                            ['followup'],
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Mitr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            },
                            // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          ),
                  )),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "ติดตามอาการ",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
            actions: [
              // icon: Icon(Icons.exit_to_app))
            ],
            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}
