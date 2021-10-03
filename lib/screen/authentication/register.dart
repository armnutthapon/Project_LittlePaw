// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/authentication/component/background.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:little_paw/screen/authentication/login.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;

  const Register({Key key, this.toggleScreen}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  var _name = TextEditingController();
  var _age = TextEditingController();
  var _phone = TextEditingController();
  var _gender;
  List listGender = ["หญิง", "ชาย", "อื่นๆ"];
  String valueGender;
  DateTime date;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1900),
        lastDate: now);
    if (picked != null && picked != date) {
      setState(() {
        _age.text = DateFormat('MM-dd-yyyy').format(picked);
      });
      print(_age.text);
    }
  }

  final _formkey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    final Size size = MediaQuery.of(context).size;
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
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    widget.toggleScreen();
                                  },
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Card(
                              margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("สมัครสมาชิก",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
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
                                        validator: (val) => val.isNotEmpty
                                            ? null
                                            : "กรุณาระบุอีเมล",
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'กรุณาระบุรหัสผ่าน';
                                          } else if (!(value.length > 5)) {
                                            return "รหัสผ่านต้องมีมากกว่า 5 ตัว";
                                          }

                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        controller: _confirmPasswordController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                        obscureText: _obscureText2,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            FontAwesomeIcons.key,
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: _toggle2,
                                            child: Icon(
                                              _obscureText2
                                                  ? FontAwesomeIcons.eyeSlash
                                                  : FontAwesomeIcons.eye,
                                              size: 15.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          labelText: 'ยืนยันรหัสผ่าน',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'กรุณาระบุรหัสผ่าน';
                                          }
                                          if (_passwordController.text !=
                                              _confirmPasswordController.text) {
                                            return "รหัสผ่านไม่ตรงกัน";
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        controller: _name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            FontAwesomeIcons.user,
                                          ),
                                          labelText: 'ชื่อผู้ใช้',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                        ),
                                        validator: (value) {
                                          // Pattern pattern =
                                          //     r'^[A-Za-z]+(?:[ _-][A-Za-z]+)*$';
                                          // RegExp regex = new RegExp(pattern);
                                          if (value == null || value.isEmpty) {
                                            return 'กรุณาระบุชื่อผู้ใช้';
                                          } else if (!(value.length > 5)) {
                                            return "ชื่อผู้ใช้ต้องมีมากกว่า 5 ตัวอักษร";
                                          }
                                          // if (!regex.hasMatch(value))
                                          //   return 'ชื่อ-นามสกุลไม่ถูกต้อง';

                                          return null;
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.06),
                                        child: ListTile(
                                          // leading: Icon(Icons.ac_unit),
                                          title: DropdownButtonFormField(
                                            hint: Text(
                                              "เพศ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Mitr'),
                                            ),
                                            isDense: false,
                                            dropdownColor: Colors.white,
                                            value: valueGender,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Mitr'),
                                            onChanged: (newValue) {
                                              setState(() {
                                                valueGender = newValue;
                                                _gender = newValue;
                                              });
                                              print(_gender);
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'กรุณาระบุเพศ';
                                              }
                                              return null;
                                            },
                                            items: listGender.map((valueItem) {
                                              return DropdownMenuItem(
                                                  value: valueItem,
                                                  child: Text(
                                                    valueItem,
                                                  ));
                                            }).toList(),
                                          ),
                                          // trailing: Icon(Icons.more_vert),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _age,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                        decoration: InputDecoration(
                                          labelText: 'วันเกิด',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                          icon: Icon(
                                            FontAwesomeIcons.calendarDay,
                                          ),
                                        ),
                                        onTap: () async {
                                          // Below line stops keyboard from appearing
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          // Show Date Picker Here
                                          await _selectDate(context);
                                          print(_age);
                                          // _addPetAge.text =
                                          //     DateFormat('dd/MM/yyyy').format(date);
                                          //setState(() {});
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'กรุณาระบุวันเกิด';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        controller: _phone,
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            FontAwesomeIcons.phone,
                                          ),
                                          labelText: 'เบอร์โทรศัพท์',
                                          labelStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                        ),
                                        validator: (value) {
                                          Pattern pattern =
                                              r'(^(?:[0])?[0-9]{10}$)';

                                          // r'(^(?:[+0]9)?[0-9]{10}$)';
                                          RegExp regex = new RegExp(pattern);
                                          if (value == null || value.isEmpty) {
                                            return 'กรุณาระบุเบอร์โทรศัพท์';
                                          } else if (!(value.length == 10)) {
                                            return "เบอร์โทรศัพท์ไม่ถูกต้อง";
                                          } else if (!regex.hasMatch(value)) {
                                            return 'เบอร์โทรศัพท์ไม่ถูกต้อง';
                                          }

                                          return null;
                                        },
                                      ),
                                    ]),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.06),
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
                                              if (_formkey.currentState
                                                  .validate()) {
                                                await loginProvider.register(
                                                  _emailController.text.trim(),
                                                  _passwordController.text
                                                      .trim(),
                                                  _name.text.trim(),
                                                );

                                                // widget.toggleScreen();
                                                // print(
                                                //     "Email : ${_emailController.text}");
                                                // print(
                                                //     "Password : ${_passwordController.text}");
                                                // print(
                                                //     "C_password : ${_confirmPasswordController.text}");
                                                // print("ชื่อ : ${_name.text}");
                                              }
                                            },
                                            child: Center(
                                              child: Text(
                                                'สมัครสมาชิก',
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
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "เป็นสมาชิกอยู่แล้ว",
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
                                                "เข้าสู่ระบบ",
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (loginProvider.errorMessageRegist != null)
              AlertDialog(
                backgroundColor: Colors.white,
                content: SingleChildScrollView(
                  child: ListTile(
                    title: Text(loginProvider.errorMessageRegist,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Mitr')),
                    trailing: IconButton(
                        color: Colors.red,
                        iconSize: 24,
                        onPressed: () {
                          loginProvider.setMessageRegist(null);
                          loginProvider.setLoadingRegist(false);
                        },
                        icon: Icon(Icons.close)),
                  ),
                ),
              ),
          ],
        ));
  }
}
