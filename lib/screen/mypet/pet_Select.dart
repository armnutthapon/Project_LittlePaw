import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../component/MenuCard.dart';
import '../mypet/pet_Information.dart';
import '../mypet/pet_Medical.dart';

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
            backgroundColor: Colors.white.withOpacity(1.0),
            elevation: 10,
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
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Column(
              children: [
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
          Column(
            children: [
              Container(
                margin: new EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_PetInformations()));
                      },
                      child: MenuCard(
                          child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Icon(
                              FontAwesomeIcons.paw,
                              color: Colors.red.shade400,
                              size: 40,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "ข้อมูลสัตว์เลี้ยง",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Mitr'),
                            ),
                          )
                        ],
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_PetMedical()));
                      },
                      child: MenuCard(
                          child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Icon(
                              FontAwesomeIcons.stethoscope,
                              color: Colors.red.shade400,
                              size: 40,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "ประวัติการรักษา",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Mitr'),
                            ),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: new EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_PetMedical()));
                      },
                      child: MenuCard(
                          child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Icon(
                              FontAwesomeIcons.syringe,
                              color: Colors.red.shade400,
                              size: 40,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "ข้อมูลวัคซีน",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Mitr'),
                            ),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
