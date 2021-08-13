import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet.dart';
import 'package:little_paw/screen/mypet/component/DeleteMypet_ButtonInfo.dart';
import 'package:little_paw/screen/mypet/component/mypet_buttoninfo.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Medical.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Information.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';

class Page_SelectPet extends StatefulWidget {
  final String pid;
  final String pet_name;
  const Page_SelectPet({
    Key key,
    this.pid,
    this.pet_name,
  }) : super(key: key);

  @override
  Page_SelectPetState createState() => Page_SelectPetState();
}

class Page_SelectPetState extends State<Page_SelectPet> {
  List data;

  var send_pid;

  getPetDetail() async {
    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showByID/${widget.pid}'));

    this.setState(() {
      data = json.decode(response.body);
    });
    return data;
  }

  deletePetByID(pid) async {
    http.Response response =
        await http.delete(Uri.parse('$Url/petDetail/deletePet/$pid'));
    print("Succes");
  }

  @override
  void initState() {
    super.initState();
    getPetDetail();
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
                  onPressed: () {
                    deletePetByID(pid);
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
                onPressed: () => Navigator.of(context).pop(context),
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
          backgroundColor: Colors.grey.shade800,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Container(
                              padding: EdgeInsets.all(10),
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
                              color: Colors.lightBlue.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    send_pid = widget.pid;
                                  });

                                  var cid_sendRoute = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Page_PetInformations(pid: send_pid));

                                  Navigator.of(context)
                                      .push(cid_sendRoute)
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                child: Mypet_ButtonInfo(
                                  text: "ข้อมูลสัตว์เลี้ยง",
                                  icon: FontAwesomeIcons.stethoscope,
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.lightBlue.shade200,
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
                              color: Colors.lightBlue.shade200,
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
                                  icon: FontAwesomeIcons.search,
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.red.shade400,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  print(widget.pid);

                                  deletePet(widget.pid);
                                },
                                child: DeleteMypet_ButtonInfo(
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
                    color: Colors.white,
                    size: 30,
                  ),
                  tooltip: 'แชร์ข้อมูล',
                  onPressed: () {
                    deletePet(widget.pid);
                  },
                ),
              )
            ],
            title: Text(widget.pet_name,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr')),
            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.pink.withOpacity(1),
            elevation: 10.0,
          ),
        ),
      ]),
    );
  }
}
