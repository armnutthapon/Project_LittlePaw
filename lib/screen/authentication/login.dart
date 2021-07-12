// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:little_paw/screen/authentication/google_signin.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Function toggleScreen;

  const Login({Key key, this.toggleScreen}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    final registerProvider = Provider.of<AuthServices>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          './assets/images/logo.png',
                          height: 120.0,
                          width: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
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
                              Text("เข้าสู่ระบบ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Mitr')),
                            ],
                          ),
                          Column(children: [
                            TextFormField(
                              controller: _emailController,
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
                              validator: (val) =>
                                  val.isNotEmpty ? null : "กรุณาใส่อีเมล",
                            ),
                            TextFormField(
                              controller: _passwordController,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Mitr'),
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.key,
                                ),
                                labelText: 'รหัสผ่าน',
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณาใส่รหัสผ่าน';
                                }
                                return null;
                              },
                            ),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "ลืมรหัสผ่าน ?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                MaterialButton(
                                  height: 40.0,
                                  minWidth: loginProvider.isLoading
                                      ? null
                                      : double.infinity,
                                  onPressed: () async {
                                    if (_formkey.currentState.validate())
                                      print("Email : ${_emailController.text}");
                                    print(
                                        "Password : ${_passwordController.text}");
                                    await loginProvider.login(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());
                                  },
                                  child: Center(
                                    child: loginProvider.isLoading
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'เข้าสู่ระบบ',
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
                          GoogleSiginBtn(),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ไม่มีบัญชีผู้ใช้ ?  ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      // if (_formkey.currentState.validate())
                                      //   print(
                                      //       "Email : ${_emailController.text}");
                                      // print(
                                      //     "Email : ${_passwordController.text}");
                                      await registerProvider.logout(
                                          // _emailController.text.trim(),
                                          // _passwordController.text.trim()
                                          );
                                    },
                                    // onPressed: () => widget.toggleScreen,
                                    child: Text(
                                      "สมัครสมาชิก",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red.shade500,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Mitr'),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, spreadRadius: 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
