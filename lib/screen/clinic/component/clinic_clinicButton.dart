import 'package:flutter/material.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Appointment.dart';
import 'package:little_paw/screen/clinic/screen/Clinic_Done_Appointment.dart';

class ClinicButton extends StatelessWidget {
  final String text;
  final Function press;
  const ClinicButton({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {}));
            },
            child: Text(
              text,
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

class ClinicButtonAppointment extends StatelessWidget {
  final String text;
  final Function press;
  const ClinicButtonAppointment({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Page_AppointmentSuccess();
              }));
            },
            child: Text(
              text,
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
