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
                FontAwesomeIcons.plus,
                color: Colors.red.shade400,
                size: 30,
              ),
              tooltip: 'เพิ่มสัตว์เลี้ยง',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page_Addpet()));
                // setState(() {});
              },
            ),
          ),
        ],
        backgroundColor: Colors.white.withOpacity(1),
        elevation: 10.0,
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
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Center(
          child: GridView.extent(
        childAspectRatio: mediaQueryData.size.height / 900,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: 200.0,
        children: <Widget>[
          PetList(petname: "ปีโป้"),
          PetList(petname: "ป๊อปปี้"),
          PetList(petname: "ซีซ่า"),
          PetList(petname: "จัมโบ้"),
          PetList(petname: "โอรีโอ้"),
        ],
      )),
    );
  }
}
