import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/Mypet_ButtonInfo.dart';
import 'package:little_paw/screen/mypet/component/PetList.dart';
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
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
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
            backgroundColor: Colors.white.withOpacity(1),
            elevation: 10.0,
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
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Page_PetInformations()));
                            },
                            child: ButtonInfo(
                              text: "ข้อมูลสัตว์เลี้ยง",
                              icon: FontAwesomeIcons.stethoscope,
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
                                  builder: (context) => Page_PetMedical()));
                            },
                            child: ButtonInfo(
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
                                    builder: (context) => Page_PetMedical()));
                              },
                              child: ButtonInfo(
                                text: "ข้อมูลวัคซีน",
                                icon: FontAwesomeIcons.syringe,
                              ),
                            )),
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
