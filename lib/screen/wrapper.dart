import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_paw/app.dart';
import 'package:little_paw/screen/authentication/authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final uid = userId.uid;
    final email = userId.email;
    if (user != null) {
      print(uid);
      print(email);

      return App();
    } else {
      return Authentication();
    }
  }
}
