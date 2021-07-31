import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  Future<void> createUserData(String name, String uid) async {
    final CollectionReference profileList =
        FirebaseFirestore.instance.collection('profileinfo');

    print("XXXXXX $name");

    // FirebaseAuth auth = FirebaseAuth.instance;
    // String uid = auth.currentUser.uid.toString();
    // profileList.add({'name': name, 'uid': uid});

    return await profileList
        .doc(uid)
        .set({'name': name, 'uid': uid}).then((value) => print("sucess"));
  }
}
