// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:little_paw/screen/authentication/google_auth.dart';
import 'package:provider/provider.dart';

class GoogleSiginBtn extends StatelessWidget {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          MaterialButton(
            height: 40.0,
            onPressed: () {},
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Google+',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mitr'),
                ),
              ],
            )),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  // Future loginWithGoogle(BuildContext context) async {
  //   GoogleSignIn _googleSignIn = GoogleSignIn(
  //     scopes: [
  //       'https://www.googleapis.com/auth/contacts.readonly',
  //     ],
  //   );
  //   GoogleSignInAccount? user = await _googleSignIn.signIn();
  //   GoogleSignInAuthentication userAuth = await user.authentication?;
  // }
  Future<Null> processSignInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    await Firebase.initializeApp().then((value) async {
      await _googleSignIn.signIn().then((value) => {});
    });
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credentail = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credentail);
    notifyListeners();
  }
}
