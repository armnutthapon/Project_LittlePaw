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
  var getAge;
  String age;

  getUserInformation() async {
    FirebaseAuth auth = await FirebaseAuth.instance;
    User userId = await auth.currentUser;
    String uid = await userId.uid;
    print("profile ID : " + uid);
    http.Response response =
        await http.get(Uri.parse('$Url/owner/showByID/$uid'));
    if (this.mounted) {
      setState(() {
        data = json.decode(response.body);
      });
    }

    // คำนวณอายุ
    await getOwnerAge();

    return data;
  }

  // ## function คำนวณอายุ
  getOwnerAge() async {
    Future.delayed(const Duration(milliseconds: 1), () {
// Here you can write your code

      setState(() async {
        http.Response response = await http
            .post(Uri.parse('$Url/owner/getage'), body: {'dob': data['dob']});
        if (this.mounted) {
          setState(() {
            getAge = json.decode(response.body);
            if (getAge[0]['age'] <= 0) {
              age = "น้อยกว่า 1";
            } else {
              age = "${getAge[0]['age']}";
            }
          });
        }
        print(getAge[0]['age']);
        // Here you can write your code for open new view
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
                margin: EdgeInsets.only(bottom: size.height * 0.01),
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
                                child: CircleAvatar(
                                  radius: 75,
                                  backgroundColor: Colors.grey.shade300,
                                  child: ClipOval(
                                    child: SizedBox(
                                        width: 140.0,
                                        height: 140.0,
                                        child: data['gender'] == "ชาย"
                                            ? Image.asset(
                                                'assets/images/male.png',
                                                fit: BoxFit.fill,
                                              )
                                            : data['gender'] == "หญิง"
                                                ? Image.asset(
                                                    'assets/images/female.png',
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    'assets/images/hamster.png',
                                                    fit: BoxFit.fill,
                                                  )),
                                  ),
                                )),
                          ],
                        ),
                      )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListView(
                        // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        padding: EdgeInsets.only(bottom: size.height * 0.1),
                        children: [
                          OwnerInfo(
                            text: "ชื่อ :",
                            textdetail: data['name'],
                          ),
                          OwnerInfo(
                            text: "อีเมล :",
                            textdetail: data['email'],
                          ),
                          OwnerInfo(
                            text: "เบอร์มือถือ :",
                            textdetail: data['contact'],
                          ),
                          OwnerInfo(
                            text: "เพศ :",
                            textdetail: data['gender'],
                          ),
                          OwnerInfo(
                            text: "อายุ :",
                            textdetail: "$age ปี",
                          ),
                          OwnerInfo(
                            text: "จำนวนสัตว์เลี้ยง :",
                            textdetail: "${data['pet_id'].length} ตัว",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                width: size.width * 0.4,
                                height: size.height * 0.05,
                                child: FlatButton(
                                    color: Colors.transparent,
                                    onPressed: () async =>
                                        await loginProvider.logout(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "ออกจากระบบ",
                                          style: TextStyle(
                                              color: Colors.red.shade400,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Mitr'),
                                        ),
                                        Icon(
                                          Icons.exit_to_app,
                                          color: Colors.red.shade400,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.paw,
                                size: 10,
                                color: Colors.red.shade400,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "LITTLE PAW ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Mitr'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
