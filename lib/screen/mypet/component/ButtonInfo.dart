import 'package:flutter/material.dart';

class ButtonInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  const ButtonInfo({Key key, @required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.red.shade100,
        child: Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
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
