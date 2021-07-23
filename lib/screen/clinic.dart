import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:little_paw/app.dart';
// import '../component/MenuCard.dart';
// import './clinic/find_Clinic.dart';
import 'package:little_paw/screen/clinic/screen/find_Clinic.dart';

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
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mitr'),
        ),
        backgroundColor:
            Colors.white.withOpacity(1), //You can make this transparent
        elevation: 10.0, //No shadow
      ),
    );
  }
}

class mainClinic extends StatefulWidget {
  @override
  _mainClinicState createState() => _mainClinicState();
}

class _mainClinicState extends State<mainClinic> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
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
          Expanded(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: new EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                child: Icon(
                                  FontAwesomeIcons.search,
                                  color: Colors.red.shade400,
                                  size: 40,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Page_FindClinic()));
                                  },
                                  child: Container(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        "ค้นหาคลินิก",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Mitr'),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                child: Icon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.red.shade400,
                                  size: 40,
                                ),
                              ),
                              InkWell(
                                  // onTap: () {
                                  //   Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //           builder: (context) => App()));
                                  // },
                                  child: Container(
                                child: Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "การนัดหมาย",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Mitr'),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),

                        // InkWell(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => Page_FindClinic()));
                        //   },
                        //   child: MenuCard(
                        //       child: Column(
                        //     children: <Widget>[
                        //       ClipRRect(
                        //         child: Icon(
                        //           FontAwesomeIcons.search,
                        //           color: Colors.red.shade400,
                        //           size: 40,
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.only(top: 15),
                        //         child: Text(
                        //           "ค้นหาคลินิก",
                        //           style: TextStyle(
                        //               fontSize: 14,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.normal,
                        //               fontFamily: 'Mitr'),
                        //         ),
                        //       )
                        //     ],
                        //   )),
                        // ),

                        // InkWell(
                        //   onTap: () {},
                        //   child: MenuCard(
                        //       child: Column(
                        //     children: <Widget>[
                        //       ClipRRect(
                        //         child: Icon(
                        //           FontAwesomeIcons.calendar,
                        //           color: Colors.red.shade400,
                        //           size: 40,
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.only(top: 15),
                        //         child: Text(
                        //           "การนัดหมาย",
                        //           style: TextStyle(
                        //               fontSize: 14,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.normal,
                        //               fontFamily: 'Mitr'),
                        //         ),
                        //       )
                        //     ],
                        //   )),
                        // ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
