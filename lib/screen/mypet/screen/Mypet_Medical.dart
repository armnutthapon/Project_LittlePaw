import 'package:flutter/material.dart';
import 'package:little_paw/screen/mypet/component/mypet_petMedical.dart';

class Page_PetMedical extends StatefulWidget {
  const Page_PetMedical({Key key}) : super(key: key);

  @override
  _Page_PetMedicalState createState() => _Page_PetMedicalState();
}

class _Page_PetMedicalState extends State<Page_PetMedical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        petMedical(),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
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

class petMedical extends StatefulWidget {
  @override
  _petMedicalState createState() => _petMedicalState();
}

class _petMedicalState extends State<petMedical> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: ShowMedicalDetail(),
            )),
          ],
        ),
      ),
    );
  }
}

class ShowMedicalDetail extends StatefulWidget {
  ShowMedicalDetail({Key key}) : super(key: key);

  @override
  _ShowMedicalDetailState createState() => _ShowMedicalDetailState();
}

class _ShowMedicalDetailState extends State<ShowMedicalDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: 5,
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
                          color: Colors.green.shade400,
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
                        height: 140,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              PetMedical(
                                date: "02/02/2020",
                                title: "ฉีดยา",
                                clinicname: "คลินิคหมอตู่",
                                details: "วัคซีน ABC",
                              ),
                            ],
                          ),
                        )))
              ],
            ),
          );
        });
  }
}
