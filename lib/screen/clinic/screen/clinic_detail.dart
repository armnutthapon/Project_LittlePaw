import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic.dart';
import 'package:little_paw/screen/clinic/component/clinic_clinicButton.dart';
import 'package:little_paw/screen/clinic/component/clinic_showAddress.dart';
import 'package:little_paw/screen/clinic/component/clinic_showText.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Appointment.dart';

class Page_ClinicDetail extends StatefulWidget {
  final String cid;

  const Page_ClinicDetail({
    Key key,
    this.cid,
  }) : super(key: key);

  @override
  _Page_ClinicDetailState createState() => _Page_ClinicDetailState();
}

class _Page_ClinicDetailState extends State<Page_ClinicDetail> {
  List<String> address = <String>[];

  var split;
  List splitList;

  final Map<int, String> values = {};
  var data;

  var send_cid;
  var send_doctor_name;
  var send_clinic_name;

  getClinicDetail() async {
    http.Response response =
        await http.get(Uri.parse('$Url/clinic/showByID/${widget.cid}'));
    print("CID :: :" + widget.cid);
    setState(() {
      data = json.decode(response.body);
      address.add(data['address'][0]['building']);
      address.add(data['address'][0]['alley']);
      address.add(data['address'][0]['street']);
      address.add(data['address'][0]['city']);
      address.add(data['address'][0]['province']);
    });
    print(address.join(' '));

    return data;
  }

  @override
  void initState() {
    super.initState();
    getClinicDetail();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          data != null
              ? Container(
                  width: double.infinity,
                  height: size.height,
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.14),
                        Container(
                          padding: EdgeInsets.only(bottom: size.height * 0.1),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ListTile(
                                  title: Text(
                                    data['clinic_name'],
                                    style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  trailing: Icon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: Colors.red.shade300,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10,
                                    bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/clinic_pet.jpg')),
                                ),
                              ),
                              Wrap(
                                children: [
                                  ShowAddress(
                                      topic: "ที่อยู่ : ",
                                      detail: address.join(' '))
                                ],
                              ),
                              ShowText(
                                  topic: "แพทย์ : ",
                                  detail: data['doctor_name']),
                              ShowText(
                                  topic: "เวลาทำการ : ",
                                  detail: data['opening_time']),
                              ShowText(
                                  topic: "วันหยุด : ", detail: data['closed']),
                              ShowText(
                                topic: "เบอร์โทรศัพท์ : ",
                                detail: data['phone_number'][0],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                width: size.width * 1,
                                height: size.height * 0.06,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: FlatButton(
                                      // color: Colors.green.shade400,
                                      color: Colors.red.shade300,
                                      onPressed: () {
                                        setState(() {
                                          send_cid = data['_id'];
                                          send_doctor_name =
                                              data['doctor_name'];
                                          send_clinic_name =
                                              data['clinic_name'];
                                        });

                                        var cid_sendRoute =
                                            new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Page_Appointment(
                                                  cid: send_cid,
                                                  doctor_name: send_doctor_name,
                                                  clinic_name:
                                                      send_clinic_name),
                                        );

                                        Navigator.of(context)
                                            .push(cid_sendRoute)
                                            .then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Text(
                                        "จองคิว",
                                        style: TextStyle(
                                          fontFamily: 'Mitr',
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text("ข้อมูลคลินิก",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.red.shade300,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mitr')),
              leading: new IconButton(
                padding: EdgeInsets.only(top: 0),
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.red.shade300,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
          ),
        ]));
  }
}
