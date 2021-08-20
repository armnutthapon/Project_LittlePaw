import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/mypet_petList.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Addpet.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Select.dart';

class MyPet extends StatefulWidget {
  const MyPet({Key key}) : super(key: key);

  @override
  _MyPetState createState() => _MyPetState();
}

class _MyPetState extends State<MyPet> {
  static const routeName = '/MyPet';
  var data;
  var arr = [];
  var pid;
  List<Function> sendPetDetail = [];

  // final String id = "";

  getPetList() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userId = auth.currentUser;
    final String uid = userId.uid;

    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showByID/$uid'));
    setState(() {
      data = json.decode(response.body);
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getPetList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.white.withOpacity(1),
          body: data != null
              ? Container(
                  child: Center(
                      child: GridView.builder(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: mediaQueryData.size.height / 900,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      maxCrossAxisExtent: 200.0,
                    ),
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      //print(data[index]);
                      return data == null
                          ? 0
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    pid = data[index]['_id'];
                                  });

                                  var pid_sendRoute = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Page_SelectPet(
                                              pid: data[index]['_id'],
                                              pet_name: data[index]
                                                  ['pet_name']));

                                  Navigator.of(context)
                                      .push(pid_sendRoute)
                                      .then((_) {
                                    getPetList();
                                    // setState(() {
                                    //   MyPet();
                                    // });
                                  });
                                },
                                child: Center(
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: data == null
                                            ? null
                                            : Image.asset(
                                                'assets/images/1.jpg',
                                                height: 120.0,
                                                width: 120.0,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: data == null
                                          ? null
                                          : Text(
                                              data[index]['pet_name'],
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Mitr'),
                                            ),
                                    ),
                                  ],
                                )),
                              ),
                            );
                    },
                  )),
                )
              : Center(child: CircularProgressIndicator())),
      appBar: AppBar(
        title: Text("สัตว์เลี้ยงของฉัน",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr')),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.plusCircle,
                color: Colors.white,
                size: 30,
              ),
              tooltip: 'เพิ่มสัตว์เลี้ยง',
              onPressed: () {
                // Navigator.pushNamed(context, '/Pagh').then((_) {
                //   // This block runs when you have returned back to the 1st Page from 2nd.
                //   setState(() {
                //     // Call setState to refresh the page.
                //   });
                // });
                Navigator.of(context)
                    .push(
                        MaterialPageRoute(builder: (context) => Page_Addpet()))
                    .then((value) => {getPetList()});
              },
            ),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 10.0,
      ),
    );
  }
}
