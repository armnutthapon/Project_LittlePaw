import 'package:flutter/material.dart';
import 'package:little_paw/screen/authentication/login.dart';
import 'package:little_paw/screen/authentication/register.dart';
import 'package:little_paw/screen/authentication/reset_password.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;

  @override
  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  Widget build(BuildContext context) {
    if (isToggle) {
      return Register(toggleScreen: toggleScreen);
    } else {
      return Login(toggleScreen: toggleScreen);
    }
  }
}
