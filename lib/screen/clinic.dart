import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:little_paw/app.dart';
import 'package:little_paw/screen/clinic/component/clinic_buttonInfo.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_FindClinic.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_MyAppointment.dart';

class Clinic extends StatefulWidget {
  const Clinic({Key key}) : super(key: key);

  @override
  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainClinic(),
      appBar: AppBar(
        title: Text(
          "คลินิก",
          style: TextStyle(
              fontSize: 22,
              color: Colors.red.shade300,
              fontWeight: FontWeight.w400,
              fontFamily: 'Mitr'),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    );
  }
}

class mainClinic extends StatefulWidget {
  @override
  _mainClinicState createState() => _mainClinicState();
}

class _mainClinicState extends State<mainClinic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 150.0),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: Image.network(
                              'https://thumbs.dreamstime.com/z/collage-different-cute-pets-text-veterinarian-clinic-white-background-banner-design-184404433.jpg',
                              height: 150,
                              width: 350,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Page_FindClinic()));
                            },
                            child: ButtonInfo(
                              text: "ค้นหาคลินิก",
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
                                  builder: (context) => Page_MyAppointment()));
                            },
                            child: ButtonInfo(
                              text: "การนัดหมาย",
                              icon: FontAwesomeIcons.calendar,
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
    );
  }
}
