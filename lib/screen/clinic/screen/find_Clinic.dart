import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'filter.dart';
import 'package:persistent_bottom/screen/clinic/screen/filter.dart';
import 'package:persistent_bottom/screen/clinic/component/ClinicCard.dart';

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
        Container(),
        findClinicMain(),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(height: 70.0),
        ])),
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
            backgroundColor:
                Colors.red.withOpacity(0.0), //You can make this transparent
            elevation: 0.0, //No shadow
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

    return Container(
      alignment: Alignment.center,
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
            //  height: size.height * 0.05,
          ),
          // Container(
          //     child: Column(
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: 40),
          //       child: ListTile(),
          //     )
          //   ],
          // )),
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
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.black45,
                      //       offset: Offset(2, 2),
                      //       blurRadius: 4
                      //       // changes position of shadow
                      //       ),
                      // ],
                    ),
                  ))),

          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: showclinicdetail(),
          )),
        ],
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
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      children: [
        ClinicCard(
            clinicname: "คลินิคหมอตู่",
            distance: "3.5 กิโลเมตร",
            location: "ป่าตอง",
            time: "เปิด 07.00 - 15.00 น."),
        ClinicCard(
            clinicname: "กะทู้คลินิคสัตว์",
            distance: "0.1 กิโลเมตร",
            location: "กะทู้",
            time: "เปิด 07.00 - 12.00 น."),
        ClinicCard(
            clinicname: "คลินิคหมอประวิทย์",
            distance: "0.1 กิโลเมตร",
            location: "กะทู้",
            time: "เปิด 09.00 - 12.00 น."),
        ClinicCard(
            clinicname: "รักษาสัตว์หมอนัส",
            distance: "2.5 กิโลเมตร",
            location: "บางลา",
            time: "เปิด 10.00 - 12.00 น."),
      ],
    );
  }
}
