// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/authentication/component/background.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:little_paw/screen/authentication/login.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;

  const Register({Key key, this.toggleScreen}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.red.shade400,
        body: Stack(
          children: [
            BackgroundPage(),
            SafeArea(
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
                                    widget.toggleScreen();
                                  },
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Card(
                              margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("สมัครสมาชิก",
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
                                        validator: (val) => val.isNotEmpty
                                            ? null
                                            : "กรุณาระบุอีเมล",
                                      ),
                                      TextFormField(
                                        controller: _passwordController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            FontAwesomeIcons.key,
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: _toggle,
                                            child: Icon(
                                              _obscureText
                                                  ? FontAwesomeIcons.eyeSlash
                                                  : FontAwesomeIcons.eye,
                                              size: 15.0,
                                              color: Colors.black,
                                            ),
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
                                            return 'กรุณาระบุรหัสผ่าน';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        controller: _confirmPasswordController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            FontAwesomeIcons.key,
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: _toggle,
                                            child: Icon(
                                              _obscureText
                                                  ? FontAwesomeIcons.eyeSlash
                                                  : FontAwesomeIcons.eye,
                                              size: 15.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          labelText: 'ยืนยันรหัสผ่าน',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                        ),
                                        // The validator receives the text that the user has entered.
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'กรุณาระบุรหัสผ่าน';
                                          }
                                          if (_passwordController.text !=
                                              _confirmPasswordController.text) {
                                            return "รหัสผ่านไม่ตรงกัน";
                                          }
                                          return null;
                                        },
                                      ),
                                    ]),
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            height: 40.0,
                                            minWidth:
                                                loginProvider.isLoadingRegist
                                                    ? null
                                                    : double.infinity,
                                            onPressed: () async {
                                              if (_formkey.currentState
                                                  .validate())
                                                await loginProvider.register(
                                                  _emailController.text.trim(),
                                                  _passwordController.text
                                                      .trim(),
                                                );

                                              print(
                                                  "Email : ${_emailController.text}");
                                              print(
                                                  "Email : ${_passwordController.text}");
                                              print(
                                                  "Email : ${_confirmPasswordController.text}");
                                            },
                                            child: Center(
                                              child: loginProvider
                                                      .isLoadingRegist
                                                  ? CircularProgressIndicator(
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.red
                                                                  .shade300),
                                                    )
                                                  : Text(
                                                      'สมัครสมาชิก',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Mitr'),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "เป็นสมาชิกอยู่แล้ว",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Mitr'),
                                          ),
                                          TextButton(
                                              onPressed: () =>
                                                  widget.toggleScreen(),
                                              child: Text(
                                                "เข้าสู่ระบบ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red.shade500,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Mitr'),
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    if (loginProvider.errorMessageRegist !=
                                        null)
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        color: Colors.amber,
                                        child: ListTile(
                                          title: Text(
                                              loginProvider.errorMessageRegist,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Mitr')),
                                          leading: Icon(Icons.error),
                                          trailing: IconButton(
                                              onPressed: () {
                                                loginProvider
                                                    .setMessageRegist(null);
                                                loginProvider
                                                    .setLoadingRegist(false);
                                              },
                                              icon: Icon(Icons.close)),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
