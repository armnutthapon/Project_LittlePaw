import 'package:flutter/material.dart';
import 'package:little_paw/screen/Clinic.dart';

class Appointment_Back extends StatefulWidget {
  final String text;
  final Function press;
  const Appointment_Back({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  @override
  _Appointment_BackState createState() => _Appointment_BackState();
}

class _Appointment_BackState extends State<Appointment_Back> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: size.width * 1,
      height: size.height * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          width: 150,
          height: 50,
          child: FlatButton(
            color: Colors.red.shade400,
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Clinic(),
                ),
                (route) => false),
            child: Text(
              'กลับหน้าหลัก',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
