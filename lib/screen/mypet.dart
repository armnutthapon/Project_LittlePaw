import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/PetCard.dart';
import './mypet/pet_Select.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../server.dart';

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
                setState(() {
                  start();
                });
              },
            ),
          )
        ],
        backgroundColor: Colors.white.withOpacity(1.0),
        elevation: 10,
      ),
    );
  }

  void start() {}
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    child: PetCard(
                                      child: Column(
                                        children: [],
                                      ),
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
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  splashColor: Colors.red.shade100,
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute());
                                  },
                                  child: Container(
                                    child: PetCard(
                                      child: Column(
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.red.shade100,
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute());
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
            ],
          )),
        ],
      ),
    );
  }
}
