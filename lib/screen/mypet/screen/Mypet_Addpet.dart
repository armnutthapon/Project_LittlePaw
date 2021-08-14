import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/database/database.dart';
import 'package:http/http.dart' as http;

class Page_Addpet extends StatefulWidget {
  const Page_Addpet({Key key}) : super(key: key);

  @override
  _Page_AddpetState createState() => _Page_AddpetState();
}

class _Page_AddpetState extends State<Page_Addpet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Addpet(),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 70.0),
        ])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            centerTitle: false,
            title: Text(
              "เพิ่มสัตว์เลี้ยง",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ),

            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white.withOpacity(1),
            elevation: 10.0, //No shadow
          ),
        ),
      ]),
    );
  }
}

class Addpet extends StatefulWidget {
  static const routeName = '/showNav';

  @override
  _AddpetState createState() => _AddpetState();
}

class _AddpetState extends State<Addpet> {
  final _formkey = GlobalKey<FormState>();

  final _addPetName = TextEditingController();
  var _addPetGender;
  var _addPetCategory;
  final _addPetColor = TextEditingController();
  final _addPetBreed = TextEditingController();
  final _addPetAge = TextEditingController();
  var _addPetSterilize;
  final _addPetCharacteristics = TextEditingController();
  final _addCongenitalDisease = TextEditingController();
  final _addVaccine = TextEditingController();

  bool sterilize = false;

  String valueGender;
  String valueCategory;
  String valueSterilize;

  List listCategory = ["สุนัข", "แมว"];
  List listGender = ["เพศผู้", "เพศเมีย"];
  List listSterilize = [
    'ทำหมันแล้ว',
    'ยังไม่ทำหมัน',
  ];

  var pet_name;
  var type;
  var sex;
  var color;
  var breed;
  var dob;
  var characteristics;
  var sterilization;
  var congenital_disease;
  var vaccine;
  var data, total;
  setData() {
    pet_name = _addPetName.text;

    sex = _addPetGender;
    type = _addPetCategory;
    sterilization = _addPetSterilize;

    color = _addPetColor.text;
    breed = _addPetBreed.text;
    dob = _addPetAge.text;
    characteristics = _addPetCharacteristics.text;
    congenital_disease = "Kuy Tuu";
    vaccine = "Where is Moderna";
    // print(pet_name + " " + sex + " " + type  + " " + color  + " " + breed  + " ");
  }

  // getPetID() async {
  //   http.Response response = await http.get(Uri.parse('$Url/petDetail'));
  //   setState(() {
  //     var resBody = json.decode(response.body);
  //     data = resBody as List;
  //     total = resBody.length;
  //   });
  //   print(data[total - 1]['_id']);
  // }

  addPetDetail() async {
    await setData();
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User userId = await auth.currentUser;
    final String uid = await userId.uid;
    await setData();
    http.Response response = await http
        .post(Uri.parse(
            '$Url/petDetail/add/$pet_name/$type/$sex/$color/$breed/$dob/$characteristics/$sterilization/$congenital_disease/$vaccine/$uid'))
        .then((value) {
      print("success");
    });
    //print(pet_name + " " + sex + " " + type  + " " + color  + " " + breed  + " " + dob  + " " + sterilization + " " + characteristics + " " + congenital_disease + " " + vaccine);
    print("add pet Success");
    //getPetID();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                              height: size.height * 0.08,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _addPetName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "ชื่อสัตว์เลี้ยง",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                onSaved: (String value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'กรุณาใส่ชื่อสัตว์เลี้ยง';
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                                height: size.height * 0.08,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      "เพศ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Mitr'),
                                    ),
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
                                        _addPetGender = newValue;
                                      });
                                      print(_addPetGender);
                                    },
                                    items: listGender.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(
                                            valueItem,
                                          ));
                                    }).toList(),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                                height: size.height * 0.08,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text("ประเภท",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Mitr')),
                                    dropdownColor: Colors.white,
                                    value: valueCategory,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueCategory = newValue;
                                        _addPetCategory = newValue;
                                      });
                                      print(_addPetCategory);
                                    },
                                    items: listCategory.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(
                                            valueItem,
                                          ));
                                    }).toList(),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                              height: size.height * 0.08,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _addPetColor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "สีของสัตว์เลี้ยง",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                onSaved: (String value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'กรุณาใส่สีของสัตว์เลี้ยง';
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                              height: size.height * 0.08,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _addPetBreed,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "สายพันธุ์",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                onSaved: (String value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'กรุณาใส่สายพันธุ์';
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                              height: size.height * 0.08,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _addPetCharacteristics,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "ลักษณะเฉพาะ",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                onSaved: (String value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'กรุณาใส่ลักษณะเฉพาะ';
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                              height: size.height * 0.08,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: _addPetAge,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "อายุ",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ),
                                onSaved: (String value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'กรุณาใส่อายุของสัตว์เลี้ยง';
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                                height: size.height * 0.08,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text("การทำหมัน",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Mitr')),
                                    dropdownColor: Colors.white,
                                    value: valueSterilize,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueSterilize = newValue;
                                        _addPetSterilize = newValue;
                                      });
                                      print(_addPetSterilize);
                                    },
                                    items: listSterilize.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(
                                            valueItem,
                                          ));
                                    }).toList(),
                                  ),
                                ))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Column(
                          children: [
                            MaterialButton(
                              height: 40.0,
                              onPressed: () {
                                if (_formkey.currentState.validate()) ;
                                if (_addPetSterilize == "ทำหมันแล้ว") {
                                  setState(() {
                                    _addPetSterilize = "true";
                                  });
                                  print(_addPetSterilize);
                                } else {
                                  _addPetSterilize = "false";
                                  print(_addPetSterilize);
                                }
                                addPetDetail();
                              },
                              child: Center(
                                child: Text(
                                  'เพิ่มสัตว์เลี้ยง',
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
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
