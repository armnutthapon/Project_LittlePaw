import 'package:firebase_auth/firebase_auth.dart';

String Url = "https://littlepaw.herokuapp.com";
String PrimaryColor = "teal.shade400";
String IconsColor = "orange.shade600";

String Indigo = "indigo.shade800";

final FirebaseAuth auth = FirebaseAuth.instance;
final User userId = auth.currentUser;
final String uid = userId.uid;
final String email = userId.email;
