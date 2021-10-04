import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/app.dart';
import 'package:little_paw/screen/mypet.dart';
import 'package:little_paw/screen/mypet/component/DeleteMypet_ButtonInfo.dart';
import 'package:little_paw/screen/mypet/component/mypet_buttoninfo.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Medical.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Information.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/wrapper.dart';

class Page_SelectPet extends StatefulWidget {
  final String pid;
  final String pet_name;
  final String urlImage;
  const Page_SelectPet({
    Key key,
    this.pid,
    this.pet_name,
    this.urlImage,
  }) : super(key: key);

  @override
  Page_SelectPetState createState() => Page_SelectPetState();
}

class Page_SelectPetState extends State<Page_SelectPet> {
  List data;

  var send_pid;

  @override
  void initState() {
    super.initState();
    print(widget.urlImage);
  }

  deletePetByID() async {
    http.Response response = await http
        .get(Uri.parse('$Url/petDetail/deletePet/$uid/${widget.pid}'))
        .then((_) {
      Navigator.of(context).pop();
      print("DELETE SUCCESS");
    });
  }

  void shareID(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var QR = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Container(
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'ID : ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mitr'),
                  children: const <TextSpan>[
                    TextSpan(
                      text: "TEST001",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Mitr'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return QR;
        });
  }

  deletePet(pid) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              pid,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
            actions: [
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.green,
                  onPressed: () async {
                    await deletePetByID();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ยืนยัน',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Mitr'),
                  )),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mitr'),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Stack(children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: widget.urlImage == null
                                    ? null
                                    : CircleAvatar(
                                        radius: 65,
                                        backgroundColor: Colors.grey.shade300,
                                        child: ClipOval(
                                          child: SizedBox(
                                              width: 140.0,
                                              height: 140.0,
                                              child: (widget.urlImage != null)
                                                  ? Image.network(
                                                      widget.urlImage,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.asset(
                                                      'assets/images/avatar.jpg',
                                                      fit: BoxFit.fill,
                                                    )),
                                        ),
                                      )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: size.height * 0.5,
                        child: GridView.extent(
                          childAspectRatio: mediaQueryData.size.height / 700,
                          primary: false,
                          padding: const EdgeInsets.all(30),
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25,
                          maxCrossAxisExtent: 200.0,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  var cid_sendRoute = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Page_PetInformations(
                                            pid: widget.pid,
                                          ));
                                  print(widget.pid);

                                  Navigator.of(context)
                                      .push(cid_sendRoute)
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                child: Mypet_ButtonInfo(
                                  text: "ข้อมูลสัตว์เลี้ยง",
                                  icon: FontAwesomeIcons.search,
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Page_PetMedical()));
                                },
                                child: Mypet_ButtonInfo(
                                  text: "ประวัติการรักษา",
                                  icon: FontAwesomeIcons.heartbeat,
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Page_PetMedical()));
                                },
                                child: Mypet_ButtonInfo(
                                  text: "ข้อมูลวัคซีน",
                                  icon: FontAwesomeIcons.syringe,
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  shareID(context);
                                },
                                child: Mypet_ButtonInfo(
                                  text: "แชร์",
                                  icon: FontAwesomeIcons.share,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                    size: 24,
                  ),
                  tooltip: 'ลบข้อมูล',
                  onPressed: () async {
                    await deletePet(widget.pid);
                    // deletePet(widget.pid);
                  },
                ),
              )
            ],
            title: Text(widget.pet_name,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mitr')),
            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}
