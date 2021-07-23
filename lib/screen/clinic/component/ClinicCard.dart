import 'package:flutter/material.dart';
import 'package:little_paw/screen/clinic/screen/clinic_detail.dart';
import 'package:little_paw/screen/clinic/screen/filter.dart';

class ClinicCard extends StatelessWidget {
  final String clinicname;
  final String distance;
  final String location;
  final String time;
  const ClinicCard(
      {Key key, this.clinicname, this.distance, this.location, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
        },
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.red.shade100,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // padding: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/1.jpg',
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clinicname,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mitr'),
                      ),
                      Text(
                        distance,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Mitr'),
                      ),
                      Text(
                        location,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Mitr'),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Mitr'),
                      )
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
