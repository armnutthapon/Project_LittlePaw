import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            backgroundColor: Colors.white.withOpacity(1.0),
            elevation: 10, //You can make this transparent
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
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 30),
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
          ),
          Expanded(
            child: Container(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ชื่อ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ปีโป้',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ประเภท :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'สุนัข',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'เพศ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ผู้',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'สี :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'น้ำตาล-ขาว',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'สายพันธุ์ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'บางแก้ว',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ลักษณะเฉพาะ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'อายุ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '1 ปี',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 2),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ทำหมัน :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ใช่',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 2, 22, 20),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'โรคประจำตัว :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mitr'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.red.shade400,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Mitr'),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 30,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Colors.grey[200])),
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
