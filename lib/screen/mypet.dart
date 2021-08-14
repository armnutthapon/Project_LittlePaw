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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPet(),
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
                FontAwesomeIcons.plus,
                color: Colors.pink.shade400,
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page_Addpet()));
              },
            ),
          ),
        ],
        backgroundColor: Colors.pinkAccent.shade100.withOpacity(1),
        elevation: 10.0,
      ),
    );
  }
}

class MainPet extends StatefulWidget {
  @override
  _MainPetState createState() => _MainPetState();
}

class _MainPetState extends State<MainPet> {
  var data;
  List<Function> sendPetDetail = [];
  var pid;

  final String id = "";

  var arr = [];

  getPetList() async {
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User userId = await auth.currentUser;
    final String uid = await userId.uid;
    print(uid);
    print(Url + "   " + "   " + "    " + uid);
    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showByID/$uid'));
    setState(() {
      data = json.decode(response.body);
    });
    print(data);
    return data;
  }

  @override
  void initState() {
    super.initState();
    getPetList();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: data != null
            ? Center(
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
                                          pet_name: data[index]['pet_name']));

                              Navigator.of(context)
                                  .push(pid_sendRoute)
                                  .then((_) {
                                setState(() {
                                  MyPet();
                                });
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
                                              color: Colors.red.shade400,
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
              ))
            : Center(child: CircularProgressIndicator()));
  }
}
