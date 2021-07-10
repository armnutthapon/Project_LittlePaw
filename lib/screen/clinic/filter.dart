import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page_FilterClinic extends StatefulWidget {
  const Page_FilterClinic({Key key}) : super(key: key);

  @override
  _Page_FilterClinicState createState() => _Page_FilterClinicState();
}

class _Page_FilterClinicState extends State<Page_FilterClinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(),
        selectFilter(),
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
              "กรองข้อมูล",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr'),
            ), // You can add title here
            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white.withOpacity(1.0),
            elevation: 10,
          ),
        ),
      ]),
    );
  }
}

class selectFilter extends StatefulWidget {
  @override
  _selectFilterState createState() => _selectFilterState();
}

class _selectFilterState extends State<selectFilter> {
  RangeValues _currentRangeValues = const RangeValues(0, 40);

  bool A = false;
  bool B = false;
  bool C = false;
  bool D = false;
  bool E = false;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height,
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: ListTile(),
              )
            ],
          )),
          Container(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: ListTile(
                  title: Text(
                    "ระยะทาง",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mitr'),
                  ),
                ),
              )
            ],
          )),
          Container(
            margin: new EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: RangeSlider(
                      activeColor: Colors.red.shade400,
                      inactiveColor: Colors.red.shade200,
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      }),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Column(
                    children: [
                      Text(
                        "ประเภทการรักษา",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mitr'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //     child: Column(
          //   children: [
          //     Padding(
          //         padding: EdgeInsets.only(left: 60),
          //         child: Container(
          //           child: Column(
          //             children: <Widget>[
          //               Column(
          //                 children: <Widget>[
          //                   Row(
          //                     children: [
          //                       Checkbox(
          //                         value: A,
          //                         onChanged: (bool value) {
          //                           setState(() {
          //                             A = value;
          //                           });
          //                         },
          //                       ),
          //                       Text("A"),
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       Checkbox(
          //                         value: B,
          //                         onChanged: (bool value) {
          //                           setState(() {
          //                             B = value;
          //                           });
          //                         },
          //                       ),
          //                       Text("B"),
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       Checkbox(
          //                         value: C,
          //                         onChanged: (bool value) {
          //                           setState(() {
          //                             C = value;
          //                           });
          //                         },
          //                       ),
          //                       Text("C"),
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       Checkbox(
          //                         value: D,
          //                         onChanged: (bool value) {
          //                           setState(() {
          //                             D = value;
          //                           });
          //                         },
          //                       ),
          //                       Text("D"),
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       Checkbox(
          //                         value: E,
          //                         onChanged: (bool value) {
          //                           setState(() {
          //                             E = value;
          //                           });
          //                         },
          //                       ),
          //                       Text("E"),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ))
          //   ],
          // )),

          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: A,
                                          onChanged: (bool value) {
                                            setState(() {
                                              A = value;
                                            });
                                          },
                                        ),
                                        Text("A"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: B,
                                          onChanged: (bool value) {
                                            setState(() {
                                              B = value;
                                            });
                                          },
                                        ),
                                        Text("B"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: C,
                                          onChanged: (bool value) {
                                            setState(() {
                                              C = value;
                                            });
                                          },
                                        ),
                                        Text("C"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: D,
                                          onChanged: (bool value) {
                                            setState(() {
                                              D = value;
                                            });
                                          },
                                        ),
                                        Text("D"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: E,
                                          onChanged: (bool value) {
                                            setState(() {
                                              E = value;
                                            });
                                          },
                                        ),
                                        Text("E"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
