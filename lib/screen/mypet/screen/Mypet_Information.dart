import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/mypet_petInfo.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/mypet/screen/Mypet_Edit_Information.dart';

class Page_PetInformations extends StatefulWidget {
  final String pid;


  const Page_PetInformations({Key key, this.pid}) : super(key: key);

  @override
  _Page_PetInformationsState createState() => _Page_PetInformationsState();
}

class _Page_PetInformationsState extends State<Page_PetInformations> {
  var data;
  String sterilization = "";
  String age;
  getPetDetail() async {
    http.Response response =
        await http.get(Uri.parse('$Url/petDetail/showPetByPID/${widget.pid}'));
    setState(() {
      data = json.decode(response.body);
      if(data['age'] <= 0){
        age = "น้อยกว่า 1";
      }else{
        age = "${data['age']}";
      }
    });
    print(age);
    return data;
  }

  @override
  void initState() {
    super.initState();
    getPetDetail();
    // getImage();
  }

  getSterilization() {
    if (data['sterilization'] == true) {
      return sterilization = "ทำหมันแล้ว";
    } else {
      return sterilization = "ยังไม่ทำหมัน";
    }
  }

  // getPetInformation() async {
  //   http.Response response =
  //       await http.get(Uri.parse('$Url/petDetail/showByPID/$pid'));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     this.setState(() {
  //       this.data = data;
  //     });
  //   }
  //   print(data);
  //   // setState(() {
  //   //   data = json.decode(response.body);
  //   // });
  //   return data;
  // }

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
      backgroundColor: Colors.white,
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
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Page_EditProfile()));
                    Navigator.of(context)
                        .push(
                          new MaterialPageRoute(
                              builder: (_) => new Page_Edit_PetInformaition(
                                    pid: widget.pid,
                                   
                                  )),
                        )
                        .then((data) => {
                              data
                                  ? data != null
                                      ? getPetDetail()
                                      : null
                                  : Center(child: CircularProgressIndicator()),
                              // print("Reload" + data)
                            });
                  },
                  icon: Icon(
                    FontAwesomeIcons.solidEdit,
                    color: Colors.red.shade300,
                  ))
              // icon: Icon(Icons.exit_to_app))
            ],
            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
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
                        padding: EdgeInsets.only(bottom: 10, top: 30),
                        child: data == null
                            ? null
                            : CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.grey.shade300,
                                child: ClipOval(
                                  child: SizedBox(
                                      width: 140.0,
                                      height: 140.0,
                                      child: (data['urlImage'] != null)
                                          ? Image.network(
                                              data['urlImage'],
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              'assets/images/avatar.jpg',
                                              fit: BoxFit.fill,
                                            )),
                                ),
                              )),
                  ],
                ),
              )),
            ),
            data != null
                ? Expanded(
                    child: Container(
                    color: Colors.white,
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
                          textdetail: "$age ปี",
                        ),
                        PetInfo(
                          text: "ทำหมัน :",
                          textdetail: getSterilization(),
                        ),
                        PetInfo(
                          text: "โรคประจำตัว :",
                          textdetail: data['congenital_disease'],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.1),
                          child: PetInfo(
                            text: "วัคซีนที่ได้รับ :",
                            textdetail: data['vaccine'][0],
                          ),
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
