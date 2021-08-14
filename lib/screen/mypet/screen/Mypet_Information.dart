import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/mypet_petInfo.dart';

class Page_PetInformations extends StatefulWidget {
  final String pid;

  const Page_PetInformations({Key key, this.pid}) : super(key: key);

  @override
  _Page_PetInformationsState createState() => _Page_PetInformationsState();
}

class _Page_PetInformationsState extends State<Page_PetInformations> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        petInformation(),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "ข้อมูลสัตว์เลี้ยง",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ),

            // You can add title here
            leading: new IconButton(
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

class petInformation extends StatefulWidget {
  static const routeName = '/showNav';

  @override
  _petInformationState createState() => _petInformationState();
}

class _petInformationState extends State<petInformation> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.1,
          ),
          Container(
            child: Container(child: showimage()),
          ),
          Expanded(
              child: Container(
            child: showpet(),
          ))
        ],
      ),
    );
  }
}

class showimage extends StatefulWidget {
  showimage({Key key}) : super(key: key);

  @override
  _showimageState createState() => _showimageState();
}

class _showimageState extends State<showimage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 50),
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
        ],
      ),
    );
  }
}

class showpet extends StatefulWidget {
  const showpet({Key key}) : super(key: key);

  @override
  _showpetState createState() => _showpetState();
}

class _showpetState extends State<showpet> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      children: [
        PetInfo(
          text: "ชื่อ",
          textdetail: "ปีโป้",
        ),
        PetInfo(
          text: "ประเภท",
          textdetail: "สุนัข",
        ),
        PetInfo(
          text: "เพศ",
          textdetail: "ผู้",
        ),
        PetInfo(
          text: "สี",
          textdetail: "น้ำตาล-ขาว",
        ),
        PetInfo(
          text: "สายพันธุ์",
          textdetail: "บางแก้ว",
        ),
        PetInfo(
          text: "ลักษณะเฉพาะ",
          textdetail: "-",
        ),
        PetInfo(
          text: "อายุ",
          textdetail: "1 ปี",
        ),
        PetInfo(
          text: "ทำหมัน",
          textdetail: "ใช่",
        ),
      ],
    );
  }
}
