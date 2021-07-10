import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../component/PetInfo.dart';
import 'package:little_paw/screen/mypet/component/PetCardInfo.dart';
// import 'package:persistent_bottom/component/PetInfoCard.dart';
// import 'package:persistent_bottom/component/looo.dart';

class PetCard extends StatefulWidget {
  @override
  const PetCard({Key key, @required this.child}) : super(key: key);

  final Widget child;
  _PetCardState createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            height: 190,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/1.jpg',
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(children: [
                      PetCardInfo(
                        petname: "AA",
                      ),
                    ]),
                  ),
                )
              ],
            )),

        // Card(
        //   child: InkWell(
        //     borderRadius: BorderRadius.circular(10),
        //     splashColor: Colors.red.shade100,
        //     child: Container(
        //       child: Container(
        //           height: 190,
        //           width: 150,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.white,
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Colors.black45,
        //                   offset: Offset(2, 2),
        //                   blurRadius: 4
        //                   // changes position of shadow
        //                   ),
        //             ],
        //           ),
        //           padding: EdgeInsets.all(15),
        //           child: Column(
        //             children: [
        //               ClipRRect(
        //                 borderRadius: BorderRadius.circular(10),
        //                 child: Image.asset(
        //                   'assets/images/1.jpg',
        //                   height: 120.0,
        //                   width: 120.0,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),

        //               // Container(
        //               //   margin: EdgeInsets.only(top: 15),
        //               //   child: Text(
        //               //     "AA",
        //               //     style: TextStyle(
        //               //         fontSize: 16,
        //               //         color: Colors.red.shade400,
        //               //         fontWeight: FontWeight.normal,
        //               //         fontFamily: 'Mitr'),
        //               //   ),
        //               // ),

        //               Expanded(
        //                 child: Container(
        //                   child: ListView(children: [
        //                     PetCardInfo(
        //                       petname: "AA",
        //                     ),
        //                   ]),
        //                 ),
        //               )
        //             ],
        //           )),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
