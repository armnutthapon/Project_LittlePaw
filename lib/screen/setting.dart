import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/profile/component/profile_informationCard.dart';
import 'package:little_paw/screen/profile/screen/Profile_Edit.dart';
import 'package:little_paw/services/authentication/auth__service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';

class Setting extends StatefulWidget {
  static const routeName = '/setting';

  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {
  _getReload() async {}
  var data;

  getUserInformation() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;
    http.Response response =
        await http.get(Uri.parse('$Url/owner/showByID/$uid'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      this.setState(() {
        this.data = data;
      });
    }

    return data;
  }

  @override
  void initState() {
    super.initState();
    //showOwnerDetail();
    getUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "โปรไฟล์",
            style: TextStyle(
                fontSize: 22,
                color: Colors.red.shade300,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mitr'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => Page_EditProfile()));
                  Navigator.of(context)
                      .push(
                        new MaterialPageRoute(
                            builder: (_) => new Page_EditProfile()),
                      )
                      .then((data) => {
                            data
                                ? data != null
                                    ? getUserInformation()
                                    : null
                                : Center(child: CircularProgressIndicator()),
                            // print("Reload" + data)
                          });
                },
                icon: Icon(
                  FontAwesomeIcons.userEdit,
                  color: Colors.amber.shade600,
                ))
            // icon: Icon(Icons.exit_to_app))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: data != null
            ? Container(
                margin: EdgeInsets.only(bottom: size.height * 0.1),
                child: Column(
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
                                child: data != null
                                    ? null
                                    : CircleAvatar(
                                        radius: 75,
                                        backgroundColor: Colors.grey.shade300,
                                        child: ClipOval(
                                          child: SizedBox(
                                            width: 140.0,
                                            height: 140.0,
                                            child: (data['urlImage'] != null)
                                                ? Image.network(
                                                    data['urlImage'],
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    'assets/images/avatar.jpg',
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ),
                                      )),
                          ],
                        ),
                      )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ListView(
                        // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        padding: EdgeInsets.zero,
                        children: [
                          OwnerInfo(
                            text: "ชื่อ :",
                            textdetail: data['name'],
                          ),
                          OwnerInfo(
                            text: "อีเมล :",
                            textdetail: data['email'],
                          ),
                          // OwnerInfo(
                          //   text: "เบอร์มือถือ :",
                          //   textdetail: data['contact'],
                          // ),
                          // OwnerInfo(
                          //   text: "เพศ :",
                          //   textdetail: data['sex'],
                          // ),
                          OwnerInfo(
                            text: "จำนวนสัตว์เลี้ยง :",
                            textdetail: "${data['pet_id'].length} ตัว",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text(
                                  "ออกจากระบบ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr'),
                                ),
                                onPressed: () async =>
                                    await loginProvider.logout(),
                              ),
                              IconButton(
                                  onPressed: () async =>
                                      await loginProvider.logout(),
                                  icon: Icon(Icons.exit_to_app)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "version : 1.2.10",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Mitr'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
