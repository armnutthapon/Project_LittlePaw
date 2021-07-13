import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/authentication/login.dart';

class MyResetPasswordPage extends StatefulWidget {
  MyResetPasswordPage(
      {Key key, void Function() resetScreen, void Function() toggleScreen})
      : super(key: key);

  @override
  _MyResetPasswordPageState createState() => _MyResetPasswordPageState();
}

class _MyResetPasswordPageState extends State<MyResetPasswordPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  TextEditingController _resetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.red.shade300,
        body: SafeArea(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              icon: Icon(Icons.arrow_back_ios,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ลืมรหัสผ่าน",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Mitr')),
                                  ],
                                ),
                                Column(children: [
                                  TextFormField(
                                    controller: _resetPasswordController,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        FontAwesomeIcons.envelope,
                                      ),
                                      labelText: 'อีเมล',
                                      labelStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mitr'),
                                    ),
                                    validator: (val) => val.isNotEmpty
                                        ? null
                                        : "กรุณาระบุอีเมล",
                                  ),
                                ]),
                                Container(
                                  margin: EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          if (_formkey.currentState
                                              .validate()) {
                                            resetPassword();
                                            Timer(Duration(seconds: 2), () {
                                              // 5 seconds over, navigate to Page2.
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Login()));
                                            });
                                          }
                                        },
                                        height: 40.0,
                                        child: Center(
                                          child: Text(
                                            'เปลี่ยนรหัสผ่าน',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Mitr'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade400,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 3,
                                  offset: Offset(10, 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  resetPassword() {
    String email = _resetPasswordController.text.trim();
    _auth.sendPasswordResetEmail(email: email);
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "กรุณาตรวจสอบอีเมล",
        style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Mitr'),
      ),
      backgroundColor: Colors.green[300],
    ));
  }
}
