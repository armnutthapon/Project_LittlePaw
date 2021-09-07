import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_paw/database/database.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),

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

class Addpet extends StatefulWidget {
  static const routeName = '/showNav';

  @override
  _AddpetState createState() => _AddpetState();
}

class _AddpetState extends State<Addpet> {
  final _formkey = GlobalKey<FormState>();

  bool _autovalidate = false;

  final _addPetName = TextEditingController();
  var _addPetGender;
  var _addPetCategory;
  final _addPetColor = TextEditingController();
  final _addPetBreed = TextEditingController();
  var _addPetSterilize;
  final _addPetCharacteristics = TextEditingController();
  final _addCongenitalDisease = TextEditingController();
  final _addVaccine = TextEditingController();
  final _addPetAge = TextEditingController();
  DateTime date;
  DateTime selectedDate = DateTime.now();
  String valueGender;
  String valueCategory;
  String valueSterilize;
  String urlImage;
  List listCategory = ["สุนัข", "แมว"];
  List listGender = ["เพศผู้", "เพศเมีย"];
  List listSterilize = [
    'ทำหมันแล้ว',
    'ยังไม่ทำหมัน',
  ];

  ImagePicker picker = ImagePicker();
  File _imageFile;

  bool _clicked = false;

  addPetDetail() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;

    var response =
        await http.post(Uri.parse('$Url/petDetail/addpet/$uid'), body: {
      'pet_name': '${_addPetName.text}',
      'type': '${_addPetCategory}',
      'sex': '${_addPetGender}',
      'color': '${_addPetColor.text}',
      'breed': '${_addPetBreed.text}',
      'dob': '${_addPetAge.text}',
      'characteristics': '${_addPetCharacteristics.text}',
      'sterilization': '${_addPetSterilize}',
      'congenital_disease': '${_addCongenitalDisease.text}',
      'vaccine': '${_addVaccine.text}',
      'urlImage': '$urlImage',
    }).then((response) {
      print("success");
      Navigator.pop(context);
    });
  }


  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1970),
        lastDate: now);
    if (picked != null && picked != date) {
      setState(() {
        _addPetAge.text = DateFormat('MM-dd-yyyy').format(picked);
      });
      print(_addPetAge.text);
    }
  }

  Future pickImage(ImageSource source) async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile == null) return;

    final imageTemporary = File(pickedFile.path);
    setState(() {
      this._imageFile = imageTemporary;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  Future<void> uploadImageToFirebase() async {
    Random random = Random();
    int random_number = random.nextInt(1000000);

    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    // firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
    //     .ref()
    //     .child('images_owner/Pet$random_number.jpg');
    firebase_storage.UploadTask uploadTask = firebase_storage
        .FirebaseStorage.instance
        .ref('pet_images/Pet$random_number.jpg')
        .putFile(_imageFile);
      
    urlImage = await (await uploadTask).ref.getDownloadURL();
    // print("urlImage : " + urlImage);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      autovalidate: _autovalidate,
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
                    child: Column(
                      children: [
                        Center(
                            child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.grey.shade300,
                          child: ClipOval(
                            child: SizedBox(
                              width: 140.0,
                              height: 140.0,
                              child: (_imageFile != null)
                                  ? Image.file(
                                      _imageFile,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      'assets/images/avatar.jpg',
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.photo_library),
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.photo_camera),
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "ชื่อ :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addPetName,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุชื่อสัตว์เลี้ยง';
                              }
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "เพศ :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: DropdownButtonFormField(
                            hint: Text(
                              "เพศของสัตว์เลี้ยง",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ),
                            isDense: false,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            dropdownColor: Colors.white,
                            value: valueGender,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            onChanged: (newValue) {
                              setState(() {
                                valueGender = newValue;
                                _addPetGender = newValue;
                              });
                              print(_addPetGender);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
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
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "ประเภท :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: DropdownButtonFormField(
                            hint: Text(
                              "ประเภทของสัตว์เลี้ยง",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ),
                            isDense: false,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            dropdownColor: Colors.white,
                            value: valueCategory,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            onChanged: (newValue) {
                              setState(() {
                                valueCategory = newValue;
                                _addPetCategory = newValue;
                              });
                              print(_addPetCategory);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุประเภท';
                              }
                              return null;
                            },
                            items: listCategory.map((valueItem) {
                              return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                  ));
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "สี :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addPetColor,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุสีของสัตว์เลี้ยง';
                              }
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "สายพันธุ์ :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addPetBreed,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุสายพันธุ์';
                              }
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "ลักษณะเฉพาะ :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addPetCharacteristics,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุลักษณะเฉพาะ';
                              }
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "วันเกิด / วันที่รับเลี้ยง :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addPetAge,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            onTap: () async {
                              // Below line stops keyboard from appearing
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              // Show Date Picker Here
                              await _selectDate(context);
                              print(_addPetAge);
                              // _addPetAge.text =
                              //     DateFormat('dd/MM/yyyy').format(date);
                              //setState(() {});
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุอายุสัตว์เลี้ยง';
                              }
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "การทำหมัน :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: DropdownButtonFormField(
                            hint: Text(
                              "การทำหมัน",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ),
                            isDense: false,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            dropdownColor: Colors.white,
                            value: valueSterilize,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            onChanged: (newValue) {
                              setState(() {
                                valueSterilize = newValue;
                                _addPetSterilize = newValue;
                              });
                              print(_addPetGender);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุการทำหมัน';
                              }
                              return null;
                            },
                            items: listSterilize.map((valueItem) {
                              return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                  ));
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "โรคประจำตัว :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addCongenitalDisease,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุโรคประจำตัว';
                              }
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey[200]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            "วัคซีน :",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                          subtitle: TextFormField(
                            controller: _addVaccine,
                            style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'กรุณาระบุวัคซีน';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: size.width * 1,
                    height: size.height * 0.06,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: MaterialButton(
                          color: Colors.red.shade300,
                          onPressed: _clicked
                              ? null
                              : () async {
                                  if (_formkey.currentState.validate()) {
                                    _clicked = true;

                                    if (_addPetSterilize == "ทำหมันแล้ว") {
                                      setState(() {
                                        _addPetSterilize = "true";
                                      });
                                      print(_addPetSterilize);
                                    } else {
                                      _addPetSterilize = "false";
                                      print(_addPetSterilize);
                                    }
                                    await uploadImageToFirebase();
                                    await addPetDetail();
                                  } else {
                                    print('invalid');
                                    setState(() => _autovalidate = true);
                                  }
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
                      ),
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
