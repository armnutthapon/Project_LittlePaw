import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/mypet_petInfo.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';

class Page_PetInformations extends StatefulWidget {
  final String pid;

  const Page_PetInformations({Key key, this.pid}) : super(key: key);

  @override
  _Page_PetInformationsState createState() => _Page_PetInformationsState();
}

class _Page_PetInformationsState extends State<Page_PetInformations> {
  var data;
  String sterilization = "";
  // getPetDetail() async {
  //   http.Response response =
  //       await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
  //   setState(() {
  //     data = json.decode(response.body);
  //   });
  //   return data;
  // }

  getPetDetail() async {
    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
    print("CID :: :" + widget.pid);
    setState(() {
      data = json.decode(response.body);
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getPetDetail();
  }

  getSterilization() {
    if (data['status'] == "Waiting") {
      return Colors.amber;
    } else if (data['sterilization'] == true) {
      return sterilization = "ทำหมันแล้ว";
    } else {
      return sterilization = "ยังไม่ทำหมัน";
    }
  }

  // getPetDetail2() async {
  //   http.Response response =
  //       await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
  //   if (!mounted) return;
  //   setState(() {
  //     data = json.encode(response.body);
  //   });
  //   // var data= await json.decode(json.encode(response.databody);

  //   print("Pid :: :" + widget.pid);
  //   print(data);

  //   return data;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getPetDetail2();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
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
        Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              child: Container(
                  child: Container(
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
              )),
            ),
            data != null
                ? Expanded(
                    child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListView(
                      // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      padding: EdgeInsets.zero,
                      children: [
                        PetInfo(
                          text: "ชื่อ :",
                          textdetail: data['pet_name'],
                        ),
                        PetInfo(
                          text: "ประเภท :",
                          textdetail: data['type'],
                        ),
                        PetInfo(
                          text: "เพศ :",
                          textdetail: data['sex'],
                        ),
                        PetInfo(
                          text: "สี :",
                          textdetail: data['color'],
                        ),
                        PetInfo(
                          text: "สายพันธุ์ :",
                          textdetail: data['breed'],
                        ),
                        PetInfo(
                          text: "ลักษณะเฉพาะ :",
                          textdetail: data['characteristics'],
                        ),
                        PetInfo(
                          text: "อายุ :",
                          textdetail: data['dob'],
                        ),
                        PetInfo(
                          text: "ทำหมัน :",
                          textdetail: getSterilization(),
                        ),
                      ],
                    ),
                  ))
                : Expanded(
                    child: Container(
                        child: Center(child: CircularProgressIndicator())),
                  )
          ],
        ),
      ]),
    );
  }
}
