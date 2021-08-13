import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic/component/clinic_clinicButton.dart';
import 'package:little_paw/screen/clinic/component/clinic_showAddress.dart';
import 'package:little_paw/screen/clinic/component/clinic_showText.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Appointment.dart';

class Page_ClinicDetail extends StatefulWidget {
  final String cid;

  const Page_ClinicDetail({
    Key key,
    this.cid,
  }) : super(key: key);

  @override
  _Page_ClinicDetailState createState() => _Page_ClinicDetailState();
}

class _Page_ClinicDetailState extends State<Page_ClinicDetail> {
  var data;

  var doctor_name = '';
  getClinic() async {
    http.Response response =
        await http.get(Uri.parse('$Url/clinic/showByID/${widget.cid}'));

    setState(() {
      data = json.decode(response.body);
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      data != null
          ? Container(
              color: Colors.grey.shade100,
              width: double.infinity,
              height: size.height,
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.14),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListTile(
                              title: data == null
                                  ? ""
                                  : Text(
                                      data['clinic_name'],
                                      style: TextStyle(
                                        fontFamily: 'Mitr',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                              trailing: Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Colors.red.shade300,
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10, bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/clinic_pet.jpg')),
                            ),
                          ),
                          ShowAddress(
                              topic: "ที่อยู่ : ",
                              detail:
                                  " 109 ม.8 ต.คุระ อ.คุระบุรี จ.พังงา 82150"),
                          ShowText(
                              topic: "แพทย์ : ", detail: data['doctor_name']),
                          ShowText(
                              topic: "เวลาทำการ : ",
                              detail: data['opening_time']),
                          ShowText(topic: "วันหยุด : ", detail: data['closed']),
                          ShowText(
                            topic: "เบอร์โทรศัพท์ : ",
                            detail: data['phone_number'][0],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            width: size.width * 1,
                            height: size.height * 0.06,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: FlatButton(
                                  color: Colors.red.shade400,
                                  onPressed: () {
                                    setState(() {
                                      // print(widget.cid);
                                      // print(widget.clinic_name);
                                      // print(widget.doctor_name);
                                    });

                                    var homeRounte = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Page_Appointment());

                                    Navigator.of(context)
                                        .push(homeRounte)
                                        .then((value) {
                                      setState(() {
                                        print("set state complete");
                                      });
                                    });
                                  },
                                  // onPressed: () {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     return Page_Appointment();
                                  //   }));
                                  // },
                                  child: Text(
                                    "จองคิว",
                                    style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
      new Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          title: Text("ข้อมูลคลินิก",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr')),
          leading: new IconButton(
            padding: EdgeInsets.only(top: 0),
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white.withOpacity(1),
          elevation: 10.0,
        ),
      ),
    ]));
  }
}
