import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';

// }

class PetMedical extends StatelessWidget {
  final String date;
  final String title;
  final String clinicname;
  final String details;
  final IconData icon;

  const PetMedical(
      {Key key,
      @required this.date,
      this.title,
      this.clinicname,
      this.details,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mitr'),
          ),
          Text(
            clinicname,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'Mitr'),
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'Mitr'),
          ),
          Text(
            details,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'Mitr'),
          ),
        ],
      ),
    );
  }
}
