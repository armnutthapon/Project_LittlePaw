import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/profile/component/profile_informationCard.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';

class Page_EditProfile extends StatefulWidget {
  static const routeName = '/setting';

  @override
  State<StatefulWidget> createState() {
    return _Page_EditProfileState();
  }
}

class _Page_EditProfileState extends State<Page_EditProfile> {
  var data;

  final _formkey = GlobalKey<FormState>();

  final user_name = TextEditingController();
  final user_contact = TextEditingController();
  var user_gender = TextEditingController();

  List listGender = ["ชาย", "หญิง", "ไม่ระบุ"];

  String valueGender;

  getUserInformation() async {
    http.Response response =
        await http.get(Uri.parse('$Url/owner/showByID/$uid'));
    if (response.statusCode == 200) {
      this.setState(() {
        this.data = jsonDecode(response.body);
      });
    }
    showUserProfile();
    return data;
  }

  updateUserProfile() async {
    if (user_name == null || user_name.text.isEmpty) {
      user_name.text = " ";
      return user_name.text = " ";
    }
    if (valueGender == null) {
      valueGender = "-";
      return '-';
    }
    if (user_contact == null || user_contact.text.isEmpty) {
      user_contact.text = "-";
      return user_contact.text = "-";
    }
    await setData();

    http.Response response = await http
        .post(Uri.parse(
            '$Url/owner/editUserProfile/$uid/${user_name.text}/${user_contact.text}/${valueGender}'))
        .then((value) {});
    print(
        '$uid    ${user_name.text}/  ${user_contact.text}/     ${valueGender}');
    print("Update success");
  }

  @override
  void initState() {
    super.initState();
    //showOwnerDetail();
    getUserInformation();
  }

  setData() {
    if (user_name.text != data['name']) {
      user_name.text = user_name.text;
    } else {
      user_name.text = data['name'];
    }

    if (user_contact.text != data['contact']) {
      user_contact.text = user_contact.text;
    } else {
      user_contact.text = data['contact'];
    }

    if (user_gender.text != data['sex']) {
      user_gender.text = user_gender.text;
    } else {
      user_gender.text = data['sex'];
    }
  }

  showUserProfile() {
    setState(() {
      user_name.text = data['name'];
      user_contact.text = data['contact'];
      user_gender.text = data['sex'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(
            "แก้ไขโปรไฟล์",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr'),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await updateUserProfile();
                  Navigator.pop(context, true);
                },
                icon: Icon(
                  FontAwesomeIcons.check,
                  color: Colors.greenAccent,
                ))
            // icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: data != null
            ? Column(
                children: <Widget>[
                  Container(
                    child: Container(
                        child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10, top: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/1.jpg',
                                height: 140,
                                width: 140,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  Expanded(
                      child: Container(
                    // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: ListView(
                      // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "ชื่อ :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: user_name,
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '-';
                                      }
                                      return "-";
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        user_name.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                  title: Text(
                                    "เบอร์มือถือ :",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                  ),
                                  subtitle: TextFormField(
                                    controller: user_contact,
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mitr'),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    onSaved: (String value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        print("null");
                                        return 'กรุณาระบุ';
                                      }
                                      return null;
                                    },
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        user_contact.clear();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.solidTimesCircle,
                                        size: 16,
                                        color: Colors.grey,
                                      ))),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border:
                                Border.all(width: 1.0, color: Colors.grey[200]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: ListTile(
                                title: Text(
                                  "เพศ :",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                subtitle: DropdownButtonFormField(
                                  icon: Icon(
                                    // Add this
                                    Icons.arrow_drop_down, // Add this
                                    color: Colors.grey.shade600, // Add this
                                  ),
                                  hint: Text(user_gender.text,
                                      style: TextStyle(
                                          color: Colors.red.shade400,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mitr')),
                                  isDense: false,
                                  decoration:
                                      InputDecoration.collapsed(hintText: ''),
                                  dropdownColor: Colors.white,
                                  value: valueGender,
                                  style: TextStyle(
                                      color: Colors.red.shade400,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueGender = newValue;
                                      user_gender = newValue;
                                    });
                                    print("Sex : $valueGender");
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return valueGender = user_gender.text;
                                      ;
                                    }
                                    return valueGender = user_gender.text;
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
                      ],
                    ),
                  ))
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
