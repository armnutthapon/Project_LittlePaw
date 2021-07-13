import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/component/PetInfo.dart';

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
            backgroundColor:
                Colors.white.withOpacity(1), //You can make this transparent
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
  var _addPetName;
  var _addPetGender;
  var _addPetCategory;
  var _addPetColor;
  var _addPetBreed;
  var _addPetAge;
  var _addPetSterilize;
  var _addPetCharacteristics;

  String valueGender;
  String valueCategory;
  String valueSterilize;

  List listCategory = ["สุนัข", "แมว"];
  List listGender = ["เพศผู้", "เพศเมีย"];
  List listSterilize = [
    'ทำหมันแล้ว',
    'ยังไม่ทำหมัน',
  ];

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
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
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 0.05,
                                  offset: Offset(2, 3)),
                            ],
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
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
                                labelText: "ชื่อสัตว์เลี้ยง",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Mitr'),
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 0.05,
                                    offset: Offset(2, 3)),
                              ],
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: double.infinity,
                                ),
                                height: size.height * 0.07,
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
                                        newValue = _addPetBreed;
                                      });
                                    },
                                    items: listGender.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(
                                            valueItem,
                                          ));
                                    }).toList(),
                                  ),
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 0.05,
                                    offset: Offset(2, 3)),
                              ],
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[200]),
                            ),
                            child: Container(
                                height: size.height * 0.07,
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
                                        newValue = _addPetCategory;
                                      });
                                    },
                                    items: listCategory.map((valueItem) {
                                      return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(
                                            valueItem,
                                          ));
                                    }).toList(),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 0.05,
                                  offset: Offset(2, 3)),
                            ],
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
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
                                labelText: "สีของสัตว์เลี้ยง",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Mitr'),
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 0.05,
                                  offset: Offset(2, 3)),
                            ],
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
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
                                labelText: "สายพันธุ์",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Mitr'),
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 0.05,
                                  offset: Offset(2, 3)),
                            ],
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
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
                                labelText: "ลักษณะเฉพาะ",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Mitr'),
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 0.05,
                                  offset: Offset(2, 3)),
                            ],
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
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
                                labelText: "อายุ",
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Mitr'),
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 0.05,
                                  offset: Offset(2, 3)),
                            ],
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
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
                                      newValue = _addPetSterilize;
                                    });
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
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          MaterialButton(
                            height: 40.0,
                            onPressed: () {},
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
        ));
  }
}
