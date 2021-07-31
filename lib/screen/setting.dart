import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Setting extends StatefulWidget {
  static const routeName = '/setting';

  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {
  String displayName;

  void initState() {
    super.initState();
    findDisplayName();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<Null> findDisplayName() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        displayName = event.displayName;
        print("displayName = $displayName");
      });
    });
  }

  void onPressed() {
    FirebaseFirestore.instance
        .collection("profileinfo")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Log Out นะจ๊ะ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        actions: [
          IconButton(
              onPressed: () async => await loginProvider.logout(),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text("$displayName"),
              MaterialButton(
                height: 40.0,
                onPressed: () {
                  onPressed();
                },
                child: Container(
                  color: Colors.amber,
                  child: Text(
                    'ชื่อ',
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
        ],
      ),
    );
  }
}
