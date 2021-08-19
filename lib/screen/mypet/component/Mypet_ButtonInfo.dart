import 'package:flutter/material.dart';

class Mypet_ButtonInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  const Mypet_ButtonInfo({Key key, @required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 20,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: size.height * 0.06,
              child: ClipRRect(
                  child: Icon(
                icon,
                color: Colors.orange.shade600,
                size: 35,
              ))),
          Text(
            text,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Mitr'),
          ),
        ],
      ),
    );
  }
}
