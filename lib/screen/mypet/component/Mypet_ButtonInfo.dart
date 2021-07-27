import 'package:flutter/material.dart';

class ButtonInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  const ButtonInfo({Key key, @required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Container(
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
                  color: Colors.red.shade400,
                  size: 35,
                ))),
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
      ),
    );
  }
}
