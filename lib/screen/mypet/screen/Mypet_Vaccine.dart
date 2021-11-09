import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Addvaccine.dart';
import 'package:http/http.dart' as http;

class Vaccineted extends StatefulWidget {
  final String pid;

  const Vaccineted({Key key, this.pid}) : super(key: key);

  @override
  _VaccinetedState createState() => _VaccinetedState();
}

class _VaccinetedState extends State<Vaccineted> {
  var data;

  getPetDetail() async {
    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
    if (this.mounted) {
      setState(() {
        data = json.decode(response.body);
      });
    }
    print(data);
    return data;
  }

  // getPetVaccine() async {
  //   http.Response response =
  //       await http.get(Uri.parse('$Url/petDetail/showByID/${widget.pid}'));
  //   print(widget.pid);

  //   if (this.mounted) {
  //     setState(() {
  //       data = json.decode(response.body);
  //     });
  //     print(data);
  //   }

  //   return data;
  // }

  @override
  void initState() {
    super.initState();
    // getPetVaccine();
    getPetDetail();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: data == null
              ? Center(
                  child: CircularProgressIndicator(
                    value: null,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.06),
                      color: Colors.white,
                      height: size.height * 0.8,
                      child: data['vaccine'].isEmpty
                          ? Center(
                              child: Text(
                              'ไม่มีประวัติวัคซีน',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                            ))
                          : ListView.builder(
                              itemCount: data['vaccine'].length,
                              // ignore: missing_return
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: size.height * 0.1,
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 0),
                                    margin: const EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(2,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "วันที่ได้รับ : ${data['vaccine'][index]['date']} ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: 'Mitr'),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.clock,
                                              size: 14,
                                              color: Colors.blue.shade800,
                                            )
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 1),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "ชื่อวัคซีน : ${data['vaccine'][index]['vaccine_name']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Mitr'),
                                          ),
                                        ),
                                      ],
                                    ));
                              }))
                ])),
        ),
      ),
      new Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.plusCircle,
                  color: Colors.red.shade300,
                  size: 30,
                ),
                tooltip: 'เพิ่มข้อมูลวัคซีน',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Add_Vaccine(pid: widget.pid)));
                },
              ),
            )
          ],
          title: Text("ข้อมูลวัคซีน",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr')),
          leading: new IconButton(
            padding: EdgeInsets.only(top: 0),
            icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
    ]));
  }
}
