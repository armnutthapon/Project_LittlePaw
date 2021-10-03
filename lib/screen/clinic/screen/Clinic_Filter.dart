import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page_FilterClinic extends StatefulWidget {
  final int dintance = 0;
  const Page_FilterClinic({Key key,}) : super(key: key);

  @override
  _Page_FilterClinicState createState() => _Page_FilterClinicState();
}

class _Page_FilterClinicState extends State<Page_FilterClinic> {
  RangeValues _currentRangeValues =  RangeValues(0, 35);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
      // backgroundColor: Colors.white,
      Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
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
                      "ระยะทาง ( กิโลเมตร )",
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
                        inactiveColor: Colors.red.shade100,
                        values: _currentRangeValues,
                      
                        min: 0,
                        max: 14000,
                        divisions: 2,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                          // print(_currentRangeValues.end);
                        }),
                  ),
                ],
              ),
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
              "กรองข้อมูล",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ), // You can add title here
            leading: new IconButton(
              padding: EdgeInsets.only(top: 0),
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.red.shade300,
              ),
              onPressed: () => 
              Navigator.pop(context,[_currentRangeValues.start,_currentRangeValues.end])
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}

// class selectFilter extends StatefulWidget {
//   @override
//   _selectFilterState createState() => _selectFilterState();
// }

// class _selectFilterState extends State<selectFilter> {
//   var start = 0 , end = 35;
//   RangeValues _currentRangeValues =  RangeValues(0, 35);
//   static String _valueToString(double value) {
//       return value.toStringAsFixed(0);
//   }
  
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           children: [
//             SizedBox(
//               height: size.height * 0.07,
//             ),
//             Container(
//                 child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 40),
//                   child: ListTile(),
//                 )
//               ],
//             )),
//             Container(
//                 child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 40),
//                   child: ListTile(
//                     title: Text(
//                       "ระยะทาง ( กิโลเมตร )",
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontFamily: 'Mitr'),
//                     ),
//                   ),
//                 )
//               ],
//             )),
//             Container(
//               margin: new EdgeInsets.only(left: 20, right: 20),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                     child: RangeSlider(
//                         activeColor: Colors.red.shade400,
//                         inactiveColor: Colors.red.shade100,
//                         values: _currentRangeValues,
                      
//                         min: 0,
//                         max: 50,
//                         divisions: 50,
//                         labels: RangeLabels(
//                           _currentRangeValues.start.round().toString(),
//                           _currentRangeValues.end.round().toString(),
//                         ),
//                         onChanged: (RangeValues values) {
//                           setState(() {
//                             _currentRangeValues = values;
//                             RangeValues(_currentRangeValues.start, _currentRangeValues.end);
//                           });
//                           print(_currentRangeValues.end);
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
