import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/services/authentication/add_user.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AuthServices with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  bool _isLoadingRegist = false;
  String _errorMessageRegist;
  bool get isLoadingRegist => _isLoadingRegist;
  String get errorMessageRegist => _errorMessageRegist;

  bool _isLoadingReset = false;
  String _errorMessageReset;
  bool get isLoadingReset => _isLoadingReset;
  String get errorMessageReset => _errorMessageReset;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(String email, String password, String name, String gender,
      String age, String phone) async {
    try {
      setLoadingRegist(true);
      UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        await registorOwner(email, name, gender, age, phone);
      });
      await setLoadingRegist(false);

      User user = await authResult.user;
      return await user;
    } on SocketException {
      setMessageRegist("No internet");
      setLoadingRegist(false);
    } on FirebaseAuthException catch (e) {
      setLoadingRegist(true);
      print('Failed with error code: ${e.code}');
      print(e.message);
      if (e.code == "invalid-email") {
        print("แบบฟอร์มอีเมลไม่ถูกต้อง");
        setMessageRegist("แบบฟอร์มอีเมลไม่ถูกต้อง");
      }
      if (e.code == "email-already-in-use") {
        print("อีเมลนี้มีบัญชีอยู่แล้ว");
        setMessageRegist("อีเมลนี้มีบัญชีอยู่แล้ว");
      }

      print(_errorMessage);
    } catch (e) {
      setLoading(false);
      setMessage(e.message);
    }
  }

  Future login(String email, String password) async {
    try {
      setLoading(true);
      GoogleAuthProvider();
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user;

      setLoading(false);
      return user;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      if (e.code == "invalid-email") {
        print("แบบฟอร์มอีเมลไม่ถูกต้อง");
        setMessage("แบบฟอร์มอีเมลไม่ถูกต้อง");
      }
      if (e.code == "user-not-found") {
        print("ไม่พบบัญชีผู้ใช้");
        setMessage("ไม่พบบัญชีผู้ใช้");
      } else if (e.code == "wrong-password") {
        print("โปรดตรวจสอบรหัสผ่าน");
        setMessage("โปรดตรวจสอบรหัสผ่าน");
      }
      print(_errorMessage);
    } catch (e) {
      setLoading(false);
      setMessage(e.message);
    }
    notifyListeners();
  }

  Future resetPassword(String email) async {
    try {} on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      if (e.code == "invalid-email") {
        print("แบบฟอร์มอีเมลไม่ถูกต้อง");
        setMessageReset("แบบฟอร์มอีเมลไม่ถูกต้อง");
      }
      if (e.code == "user-not-found") {
        print("ไม่พบบัญชีผู้ใช้");
        setMessageReset("ไม่พบบัญชีผู้ใช้");
      } else if (e.code == "wrong-password") {
        print("โปรดตรวจสอบรหัสผ่าน");
        setMessageReset("โปรดตรวจสอบรหัสผ่าน");
      }
      print(_errorMessage);
    } catch (e) {
      setLoading(false);
      setMessage(e.message);
    }
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setLoadingRegist(val) {
    _isLoadingRegist = val;
    notifyListeners();
  }

  void setMessageRegist(message) {
    _errorMessageRegist = message;
    notifyListeners();
  }

  void setLoadingReset(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessageReset(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User> get user =>
      firebaseAuth.authStateChanges().map((event) => event);
}

void registorOwner(email, name, gender, age, phone) async {
  final FirebaseAuth auth = await FirebaseAuth.instance;
  final User userId = await auth.currentUser;
  final String uid = await userId.uid;
  // final String email = await userId.email;
  print("UID : " + uid);
  // print("UserID :  $userID ");

  http.Response response =
      await http.post(Uri.parse('$Url/owner/registor'), body: {
    'userID': '$uid',
    'name': '${name}',
    'email': '${email}',
    'gender': '${gender}',
    'dob': '${age}',
    'contact': '${phone}',
    'urlImage': 'req.body.urlImage'
  }).then((value) {
    print("insert sucess");
    print("insert userID: $uid");
    print("insert name : ${name}");
    print("insert email : ${email}");
  });
}
