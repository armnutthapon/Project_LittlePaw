import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/component/PetInfo.dart';
import 'package:little_paw/screen/mypet/screen/pet_Addpet.dart';
import 'package:little_paw/screen/mypet/component/PetCard.dart';
import 'package:little_paw/screen/mypet/screen/pet_Select.dart';

// import 'mypet/component/PetCard.dart';
// import './mypet/screen/pet_Select.dart';
import 'mypet/component/PetCardInfo.dart';

class MyPet extends StatefulWidget {
  const MyPet({Key key}) : super(key: key);

  @override
  _MyPetState createState() => _MyPetState();
}

class _MyPetState extends State<MyPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPet(),
      appBar: AppBar(
        title: Text("สัตว์เลี้ยงของฉัน",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr')),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.plusCircle,
                color: Colors.red.shade400,
                size: 30,
              ),
              tooltip: 'เพิ่มสัตว์เลี้ยง',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page_Addpet()));
                setState(() {});
              },
            ),
          ),
        ],
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 10.0, //No shadow
      ),
    );
  }
}

class mainPet extends StatefulWidget {
  @override
  _mainPetState createState() => _mainPetState();
}

class _mainPetState extends State<mainPet> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.red.shade100,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Page_SelectPet()));
                              },
                              child: Container(
                                child: PetCard(
                                  child: Column(
                                    children: [PetCardInfo(petname: 'A')],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.red.shade100,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Page_SelectPet()));
                              },
                              child: Container(
                                child: PetCard(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.red.shade100,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Page_SelectPet()));
                              },
                              child: Container(
                                child: PetCard(
                                  child: Column(
                                    children: [PetCardInfo(petname: 'A')],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.red.shade100,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Page_SelectPet()));
                              },
                              child: Container(
                                child: PetCard(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.red.shade100,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Page_SelectPet()));
                              },
                              child: Container(
                                child: PetCard(
                                  child: Column(
                                    children: [PetCardInfo(petname: 'A')],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.red.shade100,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Page_SelectPet()));
                              },
                              child: Container(
                                child: PetCard(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              )
            ],
          )),
        ],
      ),
    );
  }
}
