import 'package:flutter/material.dart';

// class PetMedical extends StatefulWidget {
//   final String date;
//   final String title;
//   final String clinicname;
//   final String details;
//   PetMedical(
//       {Key key, @required this.date, this.title, this.clinicname, this.details})
//       : super(key: key);

//   @override
//   _PetMedicalState createState() => _PetMedicalState();
// }

// class _PetMedicalState extends State<PetMedical> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
//         child: Container(
//           height: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: Colors.white,
//               border: Border.all(width: 1.0, color: Colors.grey[200])),
//           child: Align(
//             alignment: Alignment.center,
//             child: Padding(
//                 padding: const EdgeInsets.fromLTRB(12, 5, 2, 5),
//                 // padding: const EdgeInsets.all(0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       clinicname,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Mitr'),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           textdetail,
//                           style: TextStyle(
//                               color: Colors.red.shade400,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w300,
//                               fontFamily: 'Mitr'),
//                         ),
//                         // IconButton(
//                         //   icon: Icon(Icons.arrow_right),
//                         //   iconSize: 25,
//                         //   onPressed: () {
//                         //     Navigator.of(context).push(MaterialPageRoute(
//                         //         builder: (context) => MyPet()));
//                         //   },
//                         // ),
//                         Icon(
//                           Icons.arrow_right,
//                           size: 25,
//                         )
//                       ],
//                     )
//                   ],
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 2, 5),
              // padding: const EdgeInsets.all(0),
              child: Column(
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
              )),
        ),
      ),
    );
  }
}
