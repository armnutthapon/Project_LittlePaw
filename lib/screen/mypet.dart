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
  var urlImage;
  getPetList() async {
    try {
      FirebaseAuth auth = await FirebaseAuth.instance;
      User userId = await auth.currentUser;
      String uid = await userId.uid;
      // print("mypet ID : " + uid);
      http.Response response =
          await http.get(Uri.parse('$Url/petDetail/showByID/$uid'));

      if (this.mounted) {
        setState(() {
          data = json.decode(response.body);
        });
      }
      return data;
    } catch (e) {}
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
        appBar: AppBar(
          title: Text("สัตว์เลี้ยงของฉัน",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr')),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.plusCircle,
                  color: Colors.red.shade300,
                  size: 30,
                ),
                tooltip: 'เพิ่มสัตว์เลี้ยง',
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => Page_Addpet()))
                      .then((value) => {getPetList()});
                },
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Scaffold(
            backgroundColor: Colors.white,
            body: FutureBuilder(
                future: getPetList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      child: Center(
                        child: data == null
                            ? Center(child: CircularProgressIndicator())
                            : data.isEmpty
                                ? Center(
                                    child: Text(
                                    'ไม่มีสัตว์เลี้ยง',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Mitr'),
                                  ))
                                : GridView.builder(
                                    primary: false,
                                    padding: EdgeInsets.fromLTRB(
                                        20, 20, 20, size.height * 0.1),
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      childAspectRatio:
                                          mediaQueryData.size.height / 900,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      maxCrossAxisExtent: 200.0,
                                    ),
                                    itemCount: data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      //print(data[index]);
                                      return data == null
                                          ? 0
                                          : Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 10,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    pid = data[index]['_id'];
                                                    urlImage =
                                                        data[index]['urlImage'];
                                                  });

                                                  var pid_sendRoute =
                                                      new MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Page_SelectPet(
                                                                  pid: data[
                                                                          index]
                                                                      ['_id'],
                                                                  pet_name: data[
                                                                          index]
                                                                      [
                                                                      'pet_name'],
                                                                  urlImage: data[
                                                                          index]
                                                                      [
                                                                      'urlImage']));

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
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: Container(
                                                          child: data == null
                                                              ? null
                                                              : CircleAvatar(
                                                                  radius: 65,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey
                                                                          .shade200,
                                                                  child:
                                                                      ClipOval(
                                                                    child: SizedBox(
                                                                        height: 120.0,
                                                                        width: 120.0,
                                                                        child: (data[index]['urlImage'] != null)
                                                                            ? Image.network(
                                                                                data[index]['urlImage'],
                                                                                fit: BoxFit.cover,
                                                                              )
                                                                            : Image.asset(
                                                                                'assets/images/avatar.jpg',
                                                                                fit: BoxFit.cover,
                                                                              )),
                                                                  ),
                                                                )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: data == null
                                                          ? null
                                                          : Text(
                                                              data[index]
                                                                  ['pet_name'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontFamily:
                                                                      'Mitr'),
                                                            ),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            );
                                    },
                                  ),
                      ),
                    );
                  }
                })));

    // body: Scaffold(
    //     backgroundColor: Colors.white,
    //     body: FutureBuilder(
    //         future: getPetList(),
    //         builder: (context, snapshot) {
    //           if (!snapshot.hasData == null) {
    //             return Center(child: CircularProgressIndicator());
    //           } else {
    //             return Container(
    //               child: Center(
    //                   child: GridView.builder(
    //                 primary: false,
    //                 padding:
    //                     EdgeInsets.fromLTRB(20, 20, 20, size.height * 0.1),
    //                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //                   childAspectRatio: mediaQueryData.size.height / 900,
    //                   crossAxisSpacing: 20,
    //                   mainAxisSpacing: 20,
    //                   maxCrossAxisExtent: 200.0,
    //                 ),
    //                 itemCount: data == null ? 0 : data.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   //print(data[index]);
    //                   return data == null
    //                       ? 0
    //                       : Card(
    //                           color: Colors.white,
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(10),
    //                           ),
    //                           elevation: 10,
    //                           child: InkWell(
    //                             onTap: () {
    //                               setState(() {
    //                                 pid = data[index]['_id'];
    //                                 urlImage = data[index]['urlImage'];
    //                               });

    //                               var pid_sendRoute = new MaterialPageRoute(
    //                                   builder: (BuildContext context) =>
    //                                       Page_SelectPet(
    //                                           pid: data[index]['_id'],
    //                                           pet_name: data[index]
    //                                               ['pet_name'],
    //                                           urlImage: data[index]
    //                                               ['urlImage']));

    //                               Navigator.of(context)
    //                                   .push(pid_sendRoute)
    //                                   .then((_) {
    //                                 getPetList();
    //                                 // setState(() {
    //                                 //   MyPet();
    //                                 // });
    //                               });
    //                             },
    //                             child: Center(
    //                                 child: Column(
    //                               children: [
    //                                 Padding(
    //                                   padding:
    //                                       const EdgeInsets.only(top: 10.0),
    //                                   child: Container(
    //                                       child: data == null
    //                                           ? null
    //                                           // : ClipRRect(
    //                                           //     borderRadius:
    //                                           //         BorderRadius.circular(100),
    //                                           //     child: Image.asset(
    //                                           //       'assets/images/1.jpg',
    //                                           //       height: 120.0,
    //                                           //       width: 120.0,
    //                                           //       fit: BoxFit.cover,
    //                                           //     ),
    //                                           //   ),
    //                                           : CircleAvatar(
    //                                               radius: 65,
    //                                               backgroundColor:
    //                                                   Colors.grey.shade300,
    //                                               child: ClipOval(
    //                                                 child: SizedBox(
    //                                                     width: 120.0,
    //                                                     height: 120.0,
    //                                                     child: (data[index][
    //                                                                 'urlImage'] !=
    //                                                             null)
    //                                                         ? Image.network(
    //                                                             data[index][
    //                                                                 'urlImage'],
    //                                                             fit: BoxFit
    //                                                                 .fill,
    //                                                           )
    //                                                         : Image.asset(
    //                                                             'assets/images/avatar.jpg',
    //                                                             fit: BoxFit
    //                                                                 .fill,
    //                                                           )),
    //                                               ),
    //                                             )),
    //                                 ),
    //                                 Padding(
    //                                   padding:
    //                                       const EdgeInsets.only(top: 10),
    //                                   child: data == null
    //                                       ? null
    //                                       : Text(
    //                                           data[index]['pet_name'],
    //                                           style: TextStyle(
    //                                               color: Colors.black54,
    //                                               fontSize: 16,
    //                                               fontWeight:
    //                                                   FontWeight.w300,
    //                                               fontFamily: 'Mitr'),
    //                                         ),
    //                                 ),
    //                               ],
    //                             )),
    //                           ),
    //                         );
    //                 },
    //               )),
    //             );
    //           }
    //         })));
  }
}
