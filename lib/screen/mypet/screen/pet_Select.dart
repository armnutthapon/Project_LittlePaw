import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/screen/pet_Medical.dart';
import 'package:little_paw/screen/mypet/screen/pet_Information.dart';
import 'package:little_paw/component/MenuCard.dart';

class Page_SelectPet extends StatefulWidget {
  const Page_SelectPet({Key key}) : super(key: key);

  @override
  Page_SelectPetState createState() => Page_SelectPetState();
}

class Page_SelectPetState extends State<Page_SelectPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        selectedPet(),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 70.0),
        ])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            centerTitle: true,
            title: Text("ปีโป้",
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

            backgroundColor:
                Colors.white.withOpacity(1), //You can make this transparent
            elevation: 10.0, //No shadow
          ),
        ),
      ]),
    );
  }
}

class selectedPet extends StatefulWidget {
  @override
  _selectedPetState createState() => _selectedPetState();
}

class _selectedPetState extends State<selectedPet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.1,
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

          SizedBox(
            height: size.height * 0.025,
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                      FontAwesomeIcons.paw,
                      color: Colors.red.shade400,
                      size: 40,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_PetInformations()));
                      },
                      child: Container(
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "ข้อมูลสัตว์เลี้ยง",
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
                      FontAwesomeIcons.heartbeat,
                      color: Colors.red.shade400,
                      size: 40,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_PetMedical()));
                      },
                      child: Container(
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "ประวัติการรักษา",
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
            )
          ]),

          SizedBox(
            height: size.height * 0.01,
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                      FontAwesomeIcons.syringe,
                      color: Colors.red.shade400,
                      size: 40,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_PetMedical()));
                      },
                      child: Container(
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "ข้อมูลวัคซีน",
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
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            )
          ]),

          // Column(
          //   children: [
          //     Container(
          //       margin: new EdgeInsets.all(10),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => Page_PetInformations()));
          //             },
          //             child: MenuCard(
          //                 child: Column(
          //               children: <Widget>[
          //                 ClipRRect(
          //                   child: Icon(
          //                     FontAwesomeIcons.paw,
          //                     color: Colors.red.shade400,
          //                     size: 40,
          //                   ),
          //                 ),
          //                 Container(
          //                   padding: EdgeInsets.only(top: 15),
          //                   child: Text(
          //                     "ข้อมูลสัตว์เลี้ยง",
          //                     style: TextStyle(
          //                         fontSize: 14,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.normal,
          //                         fontFamily: 'Mitr'),
          //                   ),
          //                 )
          //               ],
          //             )),
          //           ),
          //           InkWell(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => Page_PetMedical()));
          //             },
          //             child: MenuCard(
          //                 child: Column(
          //               children: <Widget>[
          //                 ClipRRect(
          //                   child: Icon(
          //                     FontAwesomeIcons.stethoscope,
          //                     color: Colors.red.shade400,
          //                     size: 40,
          //                   ),
          //                 ),
          //                 Container(
          //                   padding: EdgeInsets.only(top: 15),
          //                   child: Text(
          //                     "ประวัติการรักษา",
          //                     style: TextStyle(
          //                         fontSize: 14,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.normal,
          //                         fontFamily: 'Mitr'),
          //                   ),
          //                 )
          //               ],
          //             )),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       margin: new EdgeInsets.fromLTRB(20, 10, 10, 10),
          //       child: Row(
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               Navigator.of(context).push(MaterialPageRoute(
          //                   builder: (context) => Page_PetMedical()));
          //             },
          //             child: MenuCard(
          //                 child: Column(
          //               children: <Widget>[
          //                 ClipRRect(
          //                   child: Icon(
          //                     FontAwesomeIcons.syringe,
          //                     color: Colors.red.shade400,
          //                     size: 40,
          //                   ),
          //                 ),
          //                 Container(
          //                   padding: EdgeInsets.only(top: 15),
          //                   child: Text(
          //                     "ข้อมูลวัคซีน",
          //                     style: TextStyle(
          //                         fontSize: 14,
          //                         color: Colors.black,
          //                         fontWeight: FontWeight.normal,
          //                         fontFamily: 'Mitr'),
          //                   ),
          //                 )
          //               ],
          //             )),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
        ],
      ),
    );
  }
}
