import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_paw/screen/authentication/authentication.dart';
import 'package:little_paw/screen/authentication/login.dart';
import 'package:little_paw/screen/authentication/register.dart';
import 'package:provider/provider.dart';
import 'package:little_paw/screen/homeScreen/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return HomeScreen();
    } else {
      return Authentication();
    }
  }
}
