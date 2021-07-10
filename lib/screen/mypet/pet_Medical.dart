import 'package:flutter/material.dart';

class Page_PetMedical extends StatefulWidget {
  const Page_PetMedical({Key key}) : super(key: key);

  @override
  _Page_PetMedicalState createState() => _Page_PetMedicalState();
}

class _Page_PetMedicalState extends State<Page_PetMedical> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: <Widget>[
        petMedical(),
        SingleChildScrollView(child: Column(children: <Widget>[])),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            centerTitle: true,
            title: Text(
              "ประวัติการรักษา",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ),
            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.red.shade400,
              ),
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

class petMedical extends StatefulWidget {
  @override
  _petMedicalState createState() => _petMedicalState();
}

class _petMedicalState extends State<petMedical> {
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
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 70),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 2,
                                  height: 70,
                                  color: Colors.red.shade100,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15, right: 15),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 70,
                                  color: Colors.red.shade100,
                                )
                              ],
                            ),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    height: 140,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 15, 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'วันที่ : 20/20/2020',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.red.shade400,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: 'Mitr'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "ฉีดวัคซีน",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Mitr'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "คลีนิกหมอตู่",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: 'Mitr'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "วัคซีน ABC",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: 'Mitr'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )))
                          ],
                        ),
                      );
                    })),
          )
        ],
      ),
    );
  }
}
