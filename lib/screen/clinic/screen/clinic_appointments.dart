import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic/component/Calendar.dart';
import 'package:little_paw/screen/clinic/component/ClinicButton.dart';
import 'package:little_paw/screen/clinic/component/InputText.dart';

class Page_Appointment extends StatefulWidget {
  const Page_Appointment({Key key}) : super(key: key);

  @override
  _Page_AppointmentState createState() => _Page_AppointmentState();
}

class _Page_AppointmentState extends State<Page_Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(),
        Appointment(),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 70.0),
        ])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "การนัดหมาย",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ), // You can add title here
            leading: new IconButton(
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

class Appointment extends StatelessWidget {
  var appointment_time;
  var appointment_symptom;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                        title: Text(
                          "วันที่นัดหมาย",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Calendar(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                        title: Text(
                          "เวลาที่นัดหมาย",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                              Border.all(width: 1.0, color: Colors.grey[200]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: appointment_time,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Mitr'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "ระบุช่วงเวลา",
                          ),
                          onSaved: (String value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณาระบุช่วงเวลา';
                            }
                            return null;
                          },
                        ),
                      ),
                      // child: InputText(
                      //   hintText: 'ระบุช่วงเวลา',
                      //   onChanged: (String value) {},
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                        title: Text(
                          "อาการเบื้องต้น",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                              Border.all(width: 1.0, color: Colors.grey[200]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: appointment_symptom,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Mitr'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "ระบุอาการ",
                          ),
                          onSaved: (String value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณาระบุอาการ';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    ClinicButtonAppointment(text: "ยืนยัน", press: () {})
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
