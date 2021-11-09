import 'package:flutter/material.dart';
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/mypet/component/mypet_petMedical.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Page_PetMedical extends StatefulWidget {
  final String pid;

  const Page_PetMedical({Key key, this.pid}) : super(key: key);

  @override
  _Page_PetMedicalState createState() => _Page_PetMedicalState();
}

class _Page_PetMedicalState extends State<Page_PetMedical> {
  var data;

  @override
  void initState() {
    super.initState();
    // getPetVaccine();
    getPetDetail();
  }

  getPetDetail() async {
    http.Response response =
        await http.get(Uri.parse('$Url/medical/showbypid/${widget.pid}'));
    if (this.mounted) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data);
    }
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                  child: data == null
                      ? Center(
                          child: CircularProgressIndicator(
                            value: null,
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: data.isEmpty
                              ? Center(
                                  child: Text(
                                  'ไม่มีประวัติการรักษา',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Mitr'),
                                ))
                              : ListView.builder(
                                  itemCount: data[0]['medical'].length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 2,
                                                height: 70,
                                                color: Colors.green.shade100,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.green.shade400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                width: 2,
                                                height: 70,
                                                color: Colors.green.shade100,
                                              )
                                            ],
                                          ),
                                          Expanded(
                                              child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.grey[200]),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: Offset(1,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            height: size.height * 0.18,
                                            child: PetMedical(
                                              date: data[index]['date'],
                                              clinicname: data[index]
                                                  ['symptom'],
                                              title: data[index]['clinic_name'],
                                              details: data[index]['medical']
                                                  [index]['detail'],
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  }))),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "ประวัติการรักษา",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.red.shade300,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white.withOpacity(1),
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}

// class petMedical extends StatefulWidget {
//   @override
//   _petMedicalState createState() => _petMedicalState();
// }

// class _petMedicalState extends State<petMedical> {
//   // var data;

//   // getPetDetail() async {
//   //   http.Response response =
//   //       await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
//   //   if (this.mounted) {
//   //     setState(() {
//   //       data = json.decode(response.body);
//   //     });
//   //   }
//   //   print(data);
//   //   return data;
//   // }

//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           children: [
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//             Expanded(
//                 child: Container(
//               margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
//               child: ShowMedicalDetail(),
//             )),
//             SizedBox(
//               height: size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShowMedicalDetail extends StatefulWidget {
//   ShowMedicalDetail({Key key}) : super(key: key);

//   @override
//   _ShowMedicalDetailState createState() => _ShowMedicalDetailState();
// }

// class _ShowMedicalDetailState extends State<ShowMedicalDetail> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       width: 2,
//                       height: 70,
//                       color: Colors.green.shade100,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 15, right: 15),
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                           color: Colors.green.shade400,
//                           borderRadius: BorderRadius.circular(50)),
//                       child: Icon(
//                         Icons.check,
//                         size: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Container(
//                       width: 2,
//                       height: 70,
//                       color: Colors.green.shade100,
//                     )
//                   ],
//                 ),
//                 Expanded(
//                     child: Container(
//                   padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Colors.white,
//                     border: Border.all(width: 1.0, color: Colors.grey[200]),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset: Offset(1, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   height: size.height * 0.18,
//                   child: PetMedical(
//                     date: "02/02/2020",
//                     title: "ฉีดยา",
//                     clinicname: "คลินิคหมอตู่",
//                     details: "วัคซีน ABC",
//                   ),
//                 ))
//               ],
//             ),
//           );
//         });
//   }
// }
