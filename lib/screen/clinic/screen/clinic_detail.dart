import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic/component/ClinicButton.dart';
import 'package:little_paw/screen/clinic/component/ShowAddress.dart';
import 'package:little_paw/screen/clinic/component/ShowText.dart';

class Page_ClinicDetail extends StatefulWidget {
  const Page_ClinicDetail({Key key}) : super(key: key);

  @override
  _Page_ClinicDetailState createState() => _Page_ClinicDetailState();
}

class _Page_ClinicDetailState extends State<Page_ClinicDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        ClinicDetail(),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 70.0),
        ])),
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
      ]),
    );
  }
}

class ClinicDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                        title: Text(
                          "คลินิกสัตว์",
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
                            image: AssetImage('assets/images/clinic_pet.jpg')),
                      ),
                    ),
                    ShowAddress(
                        topic: "ที่อยู่ : ",
                        detail: " 109 ม.8 ต.คุระ อ.คุระบุรี จ.พังงา 82150"),
                    ShowText(topic: "แพทย์ : ", detail: "ดร.ศรวิทย์ ทองสง"),
                    ShowText(topic: "เวลาทำการ : ", detail: "08:00 - 18:00 น."),
                    ShowText(topic: "วันหยุด : ", detail: "ทุกวันอาทิตย์ "),
                    ShowText(
                      topic: "เบอร์โทรศัพท์ : ",
                      detail: "0951716431",
                    ),
                    ClinicButton(
                      text: "จองคิว",
                      press: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
