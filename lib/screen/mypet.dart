import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/component/PetInfo.dart';
import 'package:little_paw/screen/mypet/component/PetList.dart';
import 'package:little_paw/screen/mypet/screen/pet_Addpet.dart';
import 'package:little_paw/screen/mypet/component/PetCard.dart';
import 'package:little_paw/screen/mypet/screen/pet_Select.dart';
import 'package:little_paw/screen/mypet/component/PetCard.dart';

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
                    MaterialPageRoute(builder: (context) => Page_AddPet()));
                // setState(() {});
              },
            ),
          ),
        ],
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 5.0, //No shadow
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
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.red.shade100,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Page_SelectPet()));
                                  },
                                  child: Container(
                                    child: PetList(
                                      petname: "ปีโป้",
                                      //
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.red.shade100,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Page_SelectPet()));
                                  },
                                  child: Container(
                                    child: PetList(
                                      petname: "แฟนต้า",
                                      //
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.red.shade100,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Page_SelectPet()));
                                  },
                                  child: Container(
                                    child: PetList(
                                      petname: "โอเลี้ยง",
                                      //
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.red.shade100,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Page_SelectPet()));
                                  },
                                  child: Container(
                                    child: PetList(
                                      petname: "เฉาก๊วย",
                                      //
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
