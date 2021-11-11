// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:little_paw/screen/authentication/google_signin.dart';
import 'package:little_paw/screen/authentication/reset_password.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:little_paw/screen/authentication/component/background.dart';

import 'component/background.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  shareID(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var QR = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Container(
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'ID : ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mitr'),
                  children: const <TextSpan>[
                    TextSpan(
                      text: "dd",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Mitr'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return QR;
        });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Stack(
        children: [
          BackgroundPage(),
          SafeArea(
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
                            Image.asset(
                              './assets/images/littlepaw.png',
                              height: 140.0,
                              width: 140.0,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Card(
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
                                            color: Colors.red.shade300,
                                            fontWeight: FontWeight.w400,
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
                                        return 'กรุณาใส่รหัสผ่าน';
                                      }
                                      return null;
                                    },
                                  ),
                                ]),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "ลืมรหัสผ่าน ?",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Mitr'),
                                            ),
                                          ),
                                          onTap: () =>
                                              navigateToResetPasswordPage(
                                                  context))
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.05),
                                  width: size.width * 1,
                                  height: size.height * 0.06,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: MaterialButton(
                                        minWidth: loginProvider.isLoading
                                            ? null
                                            : double.infinity,
                                        color: Colors.red.shade300,
                                        onPressed: () async {
                                          if (_formkey.currentState.validate())
                                            print(
                                                "Email : ${_emailController.text}");
                                          print(
                                              "Password : ${_passwordController.text}");

                                          await loginProvider.login(
                                              _emailController.text.trim(),
                                              _passwordController.text.trim());
                                        },
                                        child: Center(
                                          child: Text(
                                            'เข้าสู่ระบบ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Mitr'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //GoogleSiginBtn(),
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
                                          onPressed: () =>
                                              widget.toggleScreen(),
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
                                ),
                              ],
                            ),
                          ),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (loginProvider.errorMessage != null)
            AlertDialog(
              backgroundColor: Colors.white,
              content: SingleChildScrollView(
                child: ListTile(
                  title: Text(loginProvider.errorMessage,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Mitr')),
                  trailing: IconButton(
                      color: Colors.red,
                      iconSize: 24,
                      onPressed: () {
                        loginProvider.setMessage(null);
                        loginProvider.setLoading(false);
                      },
                      icon: Icon(Icons.close)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  navigateToResetPasswordPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyResetPasswordPage()));
  }
}
