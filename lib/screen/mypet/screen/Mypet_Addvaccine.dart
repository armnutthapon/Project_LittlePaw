import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Add_Vaccine extends StatefulWidget {
  const Add_Vaccine({Key key}) : super(key: key);

  @override
  _Add_VaccineState createState() => _Add_VaccineState();
}

class _Add_VaccineState extends State<Add_Vaccine> {
  final _formkey = GlobalKey<FormState>();
  final vaccine_name = TextEditingController();
  final vaccine_date = TextEditingController();

  DateTime date;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1970),
        lastDate: now);
    if (picked != null && picked != date) {
      setState(() {
        vaccine_date.text = DateFormat('dd-MM-yyyy').format(picked);
      });
      print(vaccine_date.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Scaffold(
            body: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    "ชื่อวัคซีน :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: vaccine_name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      // Pattern pattern =
                                      //     r'^[A-Za-z]+(?:[ _-][A-Za-z]+)*$';
                                      // RegExp regex = new RegExp(pattern);
                                      if (value == null || value.isEmpty) {
                                        return 'กรุณาระบุชื่อวัคซีน';
                                      }
                                      // else if (!regex.hasMatch(value)) {
                                      //   return 'ชื่อไม่ถูกต้อง';
                                      // }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                child: ListTile(
                                  title: Text(
                                    "วันที่ได้รับวัคซีน :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: vaccine_date,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onTap: () async {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      await _selectDate(context);
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'กรุณาระบุวันที่';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            width: size.width * 1,
                            height: size.height * 0.06,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: MaterialButton(
                                  color: Colors.red.shade300,
                                  onPressed: () {
                                    if (_formkey.currentState.validate()) {
                                      print("Add vaccine");
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'เพิ่มข้อมูล',
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            centerTitle: false,
            title: Text("เพิ่มข้อมูลวัคซีน",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mitr')),
            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0, //No shadow
          ),
        ),
      ]),
    );
  }
}
