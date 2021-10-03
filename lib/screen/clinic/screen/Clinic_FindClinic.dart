import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Detail.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Filter.dart';
import 'package:little_paw/screen/clinic/component/clinic_clinicCard.dart';
import 'package:http/http.dart' as http;
import 'package:little_paw/database/database.dart';
import 'package:geolocator/geolocator.dart';

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
  const findClinicMain({Key key}) : super(key: key);
  @override
  _findClinicMainState createState() => _findClinicMainState();
}

class _findClinicMainState extends State<findClinicMain> {
  List data;
  var cid;
  final search = TextEditingController();
  var listclinic = [];
  double latitude, longitude;
  var distance;
  var mindistance, maxdistance;

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (this.mounted) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    }
    print(latitude);
    print(longitude);
  }

  getClinic() async {
    await _getCurrentLocation();
    http.Response response = await http.post(Uri.parse('$Url/clinic/distance'),
        body: {"longitude": '$longitude', "latitude": '$latitude'});

    setState(() {
      data = json.decode(response.body);
      for (var i = 0; i < data.length; i++) {
        listclinic.add(data[i]);
      }
    });
    print(listclinic[0]['clinic_name']);

    return data;
  }

  void filterSearchResult(String query) {
    var dummySearchList = [];
    for (var i = 0; i < data.length; i++) {
      dummySearchList.add(data[i]);
    }

    if (query.isNotEmpty) {
      var dummyListData = [];
      dummySearchList.forEach((item) {
        print(item['clinic_name']);
        if (item['clinic_name'].contains((query))) {
          dummyListData.add(item);
        }
        print(listclinic);
      });
      setState(() {
        listclinic.clear();
        listclinic.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listclinic.clear();
        for (var i = 0; i < data.length; i++) {
          listclinic.add(data[i]);
        }
      });
    }
  }

  void filterDistanceSearchResult(double mindistance, double maxdistance) {
    var dummySearchList = [];
    for (var i = 0; i < data.length; i++) {
      dummySearchList.add(data[i]);
      print(dummySearchList[i]['distance'] / 1000);
    }
    print(mindistance);
    print(maxdistance);
    if (maxdistance != 0) {
      var dummyListData = [];
      dummySearchList.forEach((item) {
        print((item['distance'] / 1000.toInt()));
        if (item['distance'] / 1000 <= maxdistance) {
          dummyListData.add(item);
        } else {
          dummyListData.remove(item);
        }
        // print(listclinic);
      });
      setState(() {
        listclinic.clear();
        listclinic.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listclinic.clear();
        for (var i = 0; i < data.length; i++) {
          listclinic.add(data[i]);
        }
      });
    }
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Page_FilterClinic()));

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if (this.mounted) {
      setState(() {
        mindistance = result[0];
        maxdistance = result[1];
      });
    }
    await filterDistanceSearchResult(mindistance, maxdistance);
    // print(mindistance);
    // print(maxdistance);
  }

  @override
  void initState() {
    getClinic();
    // _getCurrentLocation();
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.14,
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
                          child: TextField(
                            controller: search,
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
                              // suffixIcon: data.isNotEmpty ? GestureDetector(
                              //   child: Icon(Icons.close , size: 20,
                              //       color: Colors.red.shade300,),
                              //   onTap: () {
                              //      FocusScope.of(context).requestFocus(FocusNode());
                              //   },
                              // ):null
                            ),
                            onChanged: (value) {
                              filterSearchResult(value);
                            },
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
                      onPressed: () async {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Page_FilterClinic())).then((value)
                        //   {
                        //      mindistance = (value as Map)['mindistance'];
                        //      maxdistance =  (value as Map)['maxdistance'];
                        //   });
                        _navigateAndDisplaySelection(context);
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
                      itemCount: data == null ? 0 : listclinic.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                cid = listclinic[index]['_id'];
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
                                        borderRadius: BorderRadius.circular(10),
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
                                            listclinic[index]['clinic_name'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Mitr'),
                                          ),
                                          Text(
                                            "${(listclinic[index]['distance'] / 1000).toStringAsFixed(2)} กิโลเมตร",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Mitr'),
                                          ),
                                          Text(
                                            listclinic[index]['address'][0]
                                                ['city'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Mitr'),
                                          ),
                                          Text(
                                            listclinic[index]['opening_time'],
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
      backgroundColor: Colors.white,
    );
  }
}
