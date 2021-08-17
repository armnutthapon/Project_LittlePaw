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
  final user_gender = TextEditingController();



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
    await setData();
    http.Response response = await http.post(Uri.parse('$Url/owner/editUserProfile/$uid/${user_name.text}/${user_contact.text}/${user_gender.text}')).then((value) {
print("Update success");
    });
    
  }

  @override
  void initState() {
    super.initState();
    //showOwnerDetail();
    getUserInformation();
  }

  setData(){
    if(user_name.text != data['name']){
      user_name.text = user_name.text;
    }else{
      user_name.text = data['name'];
    }

    if(user_contact.text != data['contact']){
      user_contact.text = user_contact.text;
    }else{
      user_contact.text = data['contact'];
    }

    if(user_gender.text != data['sex']){
      user_gender.text = user_gender.text;
    }else{
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
            IconButton(onPressed: () async {
              await updateUserProfile();
              Navigator.pop(context,true);
            }, icon: Icon(FontAwesomeIcons.check , color: Colors.greenAccent,))
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
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: ListView(
                      // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[200]),
                              ),
                              child: Container(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                      leading: Text(
                                        "ชื่อ :",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                      ),
                                      title: Align(
                                        alignment: Alignment.center,
                                        child: TextFormField(
                                          controller: user_name,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onSaved: (String value) {},
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'กรุณาใส่อายุของสัตว์เลี้ยง';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            user_name.clear();
                                          },
                                          icon: Icon(
                                            FontAwesomeIcons.solidTimesCircle,
                                            size: 16,
                                            color: Colors.grey,
                                          ))))),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[200]),
                              ),
                              child: Container(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                      leading: Text(
                                        "เบอร์มือถือ :",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                      ),
                                      title: Align(
                                        alignment: Alignment.center,
                                        child: TextFormField(
                                          controller: user_contact,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onSaved: (String value) {},
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'กรุณาใส่อายุของสัตว์เลี้ยง';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            user_contact.clear();
                                          },
                                          icon: Icon(
                                            FontAwesomeIcons.solidTimesCircle,
                                            size: 16,
                                            color: Colors.grey,
                                          ))))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.grey[200]),
                              ),
                              child: Container(
                                  height: size.height * 0.06,
                                  child: ListTile(
                                      leading: Text(
                                        "เพศ :",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Mitr'),
                                      ),
                                      title: Align(
                                        alignment: Alignment.center,
                                        child: TextFormField(
                                          controller: user_gender,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Mitr'),
                                          ),
                                          onSaved: (String value) {},
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'กรุณาใส่อายุของสัตว์เลี้ยง';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            user_gender.clear();
                                          },
                                          icon: Icon(
                                            FontAwesomeIcons.solidTimesCircle,
                                            size: 16,
                                            color: Colors.grey,
                                          ))))),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
