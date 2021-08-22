import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Detail.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Filter.dart';
import 'package:little_paw/screen/clinic/component/clinic_clinicCard.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';

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
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ), // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
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
  List data;
  var cid;

  getClinic() async {
    http.Response response = await http.get(Uri.parse('$Url/clinic'));

    setState(() {
      data = json.decode(response.body);
    });
    print(data);
    return data;
  }

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
            //  height: size.height * 0.05,
          ),
          Container(
              // color: Colors.amber,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListTile(
                  title: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.red.shade300,
                            style: TextStyle(
                                color: Colors.red.shade300,
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
                                    color: Colors.red.shade300,
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
                    ),
                  ),
                  trailing: Container(
                    child: IconButton(
                      icon: new Icon(
                        FontAwesomeIcons.filter,
                        size: 20,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page_FilterClinic()));
                      },
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade300,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ))),
          data != null
              ? Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                cid = data[index]['_id'];
                              });

                              var cid_sendRoute = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Page_ClinicDetail(cid: cid));

                              Navigator.of(context)
                                  .push(cid_sendRoute)
                                  .then((value) {
                                setState(() {});
                              });
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                                padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                                height: 150,
                                width: 250,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          'assets/images/1.jpg',
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index]['clinic_name'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Mitr'),
                                          ),
                                          Text(
                                            "3.5 กิโลเมตร",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Mitr'),
                                          ),
                                          Text(
                                            data[index]['address'][0]['city'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Mitr'),
                                          ),
                                          Text(
                                            data[index]['opening_time'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Mitr'),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))
              : Expanded(
                  child: Container(
                      child: Center(child: CircularProgressIndicator())),
                )
        ],
      ),
    );
  }
}
