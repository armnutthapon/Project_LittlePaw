// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:little_paw/screen/mypet/screen/Mypet_Medical.dart';
// import 'package:little_paw/screen/mypet/screen/Mypet_Select.dart';

// class PetList extends StatelessWidget {
//   final String petname;

//   const PetList({Key key, @required this.petname}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       color: Colors.white,
//       elevation: 5,
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => Page_SelectPet()));
//         },
//         child: Center(
//             child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   'assets/images/1.jpg',
//                   height: 120.0,
//                   width: 120.0,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Text(
//                 petname,
//                 style: TextStyle(
//                     color: Colors.red.shade400,
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     fontFamily: 'Mitr'),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

// Widget makeItem({image, title}) {
//   return AspectRatio(
//     aspectRatio: 1 / 1,
//     child: Container(
//       margin: EdgeInsets.only(right: 15),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
//               Colors.black.withOpacity(.8),
//               Colors.black.withOpacity(.2),
//             ])),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Text(
//             title,
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//     ),
//   );
// }
