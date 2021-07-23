import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InformationText extends StatefulWidget {
  @override
  final Widget child;

  InformationText({Key key, this.child}) : super(key: key);
  _InformationTextState createState() => _InformationTextState();
}

class _InformationTextState extends State<InformationText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ :',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Mitr'),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ปีโป้',
                      style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Mitr'),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 10,
                    )
                  ],
                ),
                Container(child: widget.child),
              ],
            )),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          border: Border.all(width: 2.0, color: Colors.grey[200])),
    );
  }
}
