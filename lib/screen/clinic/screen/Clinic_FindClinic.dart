import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Detail.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Filter.dart';
import 'package:little_paw/screen/clinic/component/clinic_clinicCard.dart';

class Page_FindClinic extends StatefulWidget {
  const Page_FindClinic({Key key}) : super(key: key);

  @override
  _Page_FindClinicState createState() => _Page_FindClinicState();
}

class _Page_FindClinicState extends State<Page_FindClinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        findClinicMain(),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "ค้นหาคลินิก",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ), // You can add title here
            leading: new IconButton(
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

class findClinicMain extends StatefulWidget {
  @override
  _findClinicMainState createState() => _findClinicMainState();
}

class _findClinicMainState extends State<findClinicMain> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
              //  height: size.height * 0.05,
            ),
            Container(
                // color: Colors.amber,
                padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: ListTile(
                    title: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.red.shade400,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mitr'),
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 20, bottom: 11, top: 11, right: 0),
                                hintText: "ค้นหาคลินิก",
                                prefixIcon: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      size: 20,
                                      color: Colors.red.shade400,
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],

                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black45,
                        //       offset: Offset(2, 2),
                        //       blurRadius: 4
                        //       // changes position of shadow
                        //       ),
                        // ],
                      ),
                    ),
                    trailing: Container(
                      child: IconButton(
                        icon: new Icon(
                          FontAwesomeIcons.filter,
                          size: 20,
                        ),
                        color: Colors.red.shade400,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Page_FilterClinic()));
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ))),
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: showclinicdetail(),
            )),
          ],
        ),
      ),
    );
  }
}

class showclinicdetail extends StatefulWidget {
  showclinicdetail({Key key}) : super(key: key);

  @override
  _showclinicdetailState createState() => _showclinicdetailState();
}

class _showclinicdetailState extends State<showclinicdetail> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
          },
          child: ClinicCard(
              clinicname: "คลินิคหมอตู่",
              distance: "3.5 กิโลเมตร",
              location: "ป่าตอง",
              time: "เปิด 07.00 - 15.00 น."),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
          },
          child: ClinicCard(
              clinicname: "คลินิคหมอประวิทย์",
              distance: "0.1 กิโลเมตร",
              location: "กะทู้",
              time: "เปิด 09.00 - 12.00 น."),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
          },
          child: ClinicCard(
              clinicname: "รักษาสัตว์หมอนัส",
              distance: "2.5 กิโลเมตร",
              location: "บางลา",
              time: "เปิด 10.00 - 12.00 น."),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
          },
          child: ClinicCard(
              clinicname: "รักษาสัตว์หมอนัส",
              distance: "2.5 กิโลเมตร",
              location: "บางลา",
              time: "เปิด 10.00 - 12.00 น."),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
          },
          child: ClinicCard(
              clinicname: "รักษาสัตว์หมอนัส",
              distance: "2.5 กิโลเมตร",
              location: "บางลา",
              time: "เปิด 10.00 - 12.00 น."),
        ),
      ],
    );
  }
}
