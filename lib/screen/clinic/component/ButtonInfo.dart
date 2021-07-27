import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  const ButtonInfo({Key key, @required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // child: Column(
      //   children: [
      //     Card(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(5),
      //       ),
      //       elevation: 2,
      //       color: Colors.red.shade400,
      //       child: Padding(
      //         padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
      //         child: Row(
      //           children: [
      //             ClipRect(
      //                 child: Icon(
      //               icon,
      //               color: Colors.white,
      //               size: 30,
      //             )),
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      //               child: Text(
      //                 text,
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w500,
      //                     fontFamily: 'Mitr'),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.red.shade100,
        child: Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
            height: 120,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.grey[200])
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black45, offset: Offset(2, 2), blurRadius: 4
                //       // changes position of shadow
                //       ),
                // ],
                ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                          child: Icon(
                        icon,
                        color: Colors.red.shade400,
                        size: 40,
                      )),
                      Text(
                        text,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mitr'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
