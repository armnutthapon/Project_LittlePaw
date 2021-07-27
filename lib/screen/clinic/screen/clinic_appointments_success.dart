import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic/component/AppointmentBack.dart';
import 'package:little_paw/screen/clinic.dart';

class Page_AppointmentSuccess extends StatefulWidget {
  const Page_AppointmentSuccess({Key key}) : super(key: key);

  @override
  _Page_AppointmentSuccessState createState() =>
      _Page_AppointmentSuccessState();
}

class _Page_AppointmentSuccessState extends State<Page_AppointmentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(),
        AppointmentSuccess(),
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
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Clinic(),
                  ),
                  (route) => false),
            ),
            backgroundColor: Colors.white.withOpacity(1.0),
            elevation: 10,
          ),
        ),
      ]),
    );
  }
}

class AppointmentSuccess extends StatelessWidget {
  const AppointmentSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 1,
                      height: size.height * 0.4,
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.orange.shade400,
                              size: 70,
                            ),
                            SizedBox(height: size.height * 0.1),
                            Text(
                              "รอการตอบรับจากคลีนิก",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Appointment_Back(text: "กลับหน้าหลัก", press: () {})
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
