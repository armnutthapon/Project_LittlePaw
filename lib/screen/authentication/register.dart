// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
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
                              validator: (val) =>
                                  val.isNotEmpty ? null : "กรุณา",
                            ),
                            TextFormField(
                              controller: _passwordController,
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
                                  return 'Please enter some text';
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
                                        "Email : ${_passwordController.text}");
                                    await loginProvider.register(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());
                                  },
                                  child: Center(
                                    child: loginProvider.isLoading
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'สมัครสมาชิก',
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
                        BoxShadow(color: Colors.grey.shade200, spreadRadius: 3),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (loginProvider.errorMessage != null)
                    Container(
                      color: Colors.amber,
                      child: ListTile(
                        title: Text(loginProvider.errorMessage),
                        leading: Icon(Icons.error),
                        trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => loginProvider.setMessage(null)),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
