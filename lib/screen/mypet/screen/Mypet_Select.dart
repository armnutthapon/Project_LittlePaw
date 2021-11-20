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
import 'package:little_paw/screen/mypet/screen/Mypet_Vaccine.dart';
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

class Page_SelectPetState extends State<Page_SelectPet>
    with TickerProviderStateMixin {
  var data;

  var send_pid;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print(widget.urlImage);
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 3));
    // _controller.forward();
  }

  Animation<int> animation;
  AnimationController _controller;

  createAlertDialog(BuildContext context) {
    try {
      Size size = MediaQuery.of(context).size;

      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              actions: [
                Container(
                    height: size.height * 0.1,
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        text: 'สำเร็จ! กดปุ่ม ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mitr'),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'แชร์ไอดี',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                        ],
                      ),
                    ))),
              ],
            );
          });
    } catch (e) {
      print(e);
    }
  }

  deletePetByID() async {
    try {
      http.Response response = await http
          .get(Uri.parse('$Url/petDetail/deletePet/$uid/${widget.pid}'))
          .then((response) async {
        Navigator.of(context).pop();
      });
    } catch (e) {
      print(e);
    }
  }

  walkin() async {
    try {
      http.Response response = await http
          .post(Uri.parse('$Url/petDetail/createWalkInID/${widget.pid}'))
          .then((value) {
        setState(() {
          _controller.reset();
          _controller.forward();
        });
        isLoading = false;
        print("Doggy Create Walkin");
      });
      await shareID_show();
    } catch (e) {}

    // _onLoading();
  }

  shareID_show() async {
    try {
      http.Response response = await http
          .get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
      if (this.mounted) {
        setState(() {
          data = json.decode(response.body);
        });
      }
      print(data['WalkIn_id']);
      print(data['WalkIn_pass']);

      return data;
    } catch (e) {}
  }

  void shareID(BuildContext context) {
    try {
      Size size = MediaQuery.of(context).size;
      var QR = data == null
          ? AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              actions: [
                Container(
                    height: size.height * 0.1,
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        text: 'กรุณากดปุ่ม ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mitr'),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Walk In',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Mitr'),
                          ),
                        ],
                      ),
                    )))
              ],
            )
          : AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              actions: [
                Container(
                    child: Column(
                  children: [
                    Row(
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
                            children: <TextSpan>[
                              TextSpan(
                                text: "${data['WalkIn_id']}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Mitr'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'PASSWORD : ',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Mitr'),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${data['WalkIn_pass']}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Mitr'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "เหลือเวลาอีก : ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mitr'),
                        ),
                        Countdown(
                          animation: StepTween(
                            begin: 3 * 60,
                            end: 0,
                          ).animate(_controller),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return QR;
          });
    } catch (e) {
      print(e);
    }
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
              "ต้องการลบข้อมูลสัตว์เลี้ยง ?",
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
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      'assets/images/avatar.jpg',
                                                      fit: BoxFit.cover,
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
                                      builder: (context) =>
                                          Page_PetMedical(pid: widget.pid)));
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
                                      builder: (context) => Vaccineted(
                                            pid: widget.pid,
                                          )));
                                },
                                child: Mypet_ButtonInfo(
                                  text: "ข้อมูลวัคซีน",
                                  icon: FontAwesomeIcons.syringe,
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: size.width * 0.4,
                                    height: size.height * 0.07,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade400,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        Future.delayed(
                                            const Duration(seconds: 1), () {
                                          setState(() async {
                                            await walkin();
                                            createAlertDialog(context);

                                            // Here you can write your code for open new view
                                          });
                                        });
                                      },
                                      child: (isLoading)
                                          ? SizedBox(
                                              width: 16,
                                              height: 16,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 1.5,
                                              ))
                                          : const Text(
                                              "Walk In",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: 'Mitr'),
                                            ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.4,
                                    height: size.height * 0.07,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade200,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      onPressed: () {
                                        shareID(context);
                                      },
                                      child: const Text(
                                        "แชร์ไอดี",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Mitr'),
                                      ),
                                    ),
                                  ),
                                ],
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
                icon:
                    new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
                onPressed: () {
                  _controller.reset();

                  Navigator.of(context).pop();
                }),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(
          fontSize: 12,
          color: Colors.red.shade400,
          fontWeight: FontWeight.w400,
          fontFamily: 'Mitr'),
    );
  }
}
