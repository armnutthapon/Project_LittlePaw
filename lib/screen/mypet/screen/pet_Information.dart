import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:persistent_bottom/screen/mypet/component/PetInfoCard.dart';
import 'package:persistent_bottom/screen/mypet/component/PetInfo.dart';

class Page_PetInformations extends StatefulWidget {
  const Page_PetInformations({Key key}) : super(key: key);

  @override
  _Page_PetInformationsState createState() => _Page_PetInformationsState();
}

class _Page_PetInformationsState extends State<Page_PetInformations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        petInformation(),
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
            title: Text(
              "ข้อมูลสัตว์เลี้ยง",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.share,
                    color: Colors.red.shade400,
                    size: 30,
                  ),
                  tooltip: 'แชร์ข้อมูล',
                  onPressed: () {},
                ),
              )
            ],

            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor:
                Colors.red.withOpacity(0.0), //You can make this transparent
            elevation: 0.0, //No shadow
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
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          child: Container(color: Colors.grey[100], child: showimage()),
        ),
        Expanded(
            child: Container(
          color: Colors.grey[100],
          child: showpet(),
        ))
      ],
    );
  }
}

// Container(
//   margin: EdgeInsets.only(
//     top: 10,
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         padding: EdgeInsets.only(bottom: 10, top: 50),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.asset(
//             'assets/images/1.jpg',
//             height: 140,
//             width: 140,
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     ],
//   ),
// )
// Expanded(
//   child: Container(
//       child: ListView(
//     children: [
//       TextInfo(
//         text: "ชื่อ",
//         textdetail: "ปีโป้",
//       ),
//       TextInfo(
//         text: "ประเภท",
//         textdetail: "สุนัข",
//       ),
//       TextInfo(
//         text: "เพศ",
//         textdetail: "ผู้",
//       ),
//       TextInfo(
//         text: "สี",
//         textdetail: "น้ำตาล-ขาว",
//       ),
//       TextInfo(
//         text: "สายพันธุ์",
//         textdetail: "บางแก้ว",
//       ),
//       TextInfo(
//         text: "ลักษณะเฉพาะ",
//         textdetail: "-",
//       ),
//       TextInfo(
//         text: "อายุ",
//         textdetail: "1 ปี",
//       ),
//       TextInfo(
//         text: "ทำหมัน",
//         textdetail: "ใช่",
//       )
//     ],
//   )),
// )

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
