import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:little_paw/app.dart';
import 'package:little_paw/screen/clinic/component/ButtonInfo.dart';
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
        backgroundColor: Colors.white, //You can make this transparent
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
                        InkWell(
                          splashColor: Colors.red.shade100,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Page_FindClinic()));
                          },
                          child: Container(
                            child: ButtonInfo(
                              icon: FontAwesomeIcons.search,
                              text: "ค้นหาคลินิค",
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.red.shade100,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Page_FindClinic()));
                          },
                          child: Container(
                            child: ButtonInfo(
                              icon: Icons.calendar_today,
                              text: "การนัดหมาย",
                            ),
                          ),
                        ),
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
