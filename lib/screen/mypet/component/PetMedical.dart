import 'package:flutter/material.dart';

// }

class PetMedical extends StatelessWidget {
  final String date;
  final String title;
  final String clinicname;
  final String details;
  const PetMedical(
      {Key key, @required this.date, this.title, this.clinicname, this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Mitr'),
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Mitr'),
        ),
        Text(
          clinicname,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Mitr'),
        ),
        Text(
          details,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Mitr'),
        ),
      ],
    );
    // return Container(
    //   color: Colors.red,
    //   child: Padding(
    //     padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
    //     child: Align(
    //       alignment: Alignment.center,
    //       child: Padding(
    //           padding: const EdgeInsets.fromLTRB(12, 5, 2, 5),
    //           // padding: const EdgeInsets.all(0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 date,
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     fontFamily: 'Mitr'),
    //               ),
    //               Text(
    //                 title,
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     fontFamily: 'Mitr'),
    //               ),
    //               Text(
    //                 clinicname,
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     fontFamily: 'Mitr'),
    //               ),
    //               Text(
    //                 details,
    //                 style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     fontFamily: 'Mitr'),
    //               ),
    //             ],
    //           )),
    //     ),
    //   ),
    // );
  }
}
