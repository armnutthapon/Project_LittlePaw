import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/screen/pet_Medical.dart';

class PetList extends StatelessWidget {
  final String petname;

  const PetList({Key key, @required this.petname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.all(20.0),
    //   child: Column(
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(10),
    //         child: Image.asset(
    //           'assets/images/1.jpg',
    //           height: 120.0,
    //           width: 120.0,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       Text(petname)
    //       // Card(
    //       //   child: Container(
    //       //     child: Column(
    //       //       children: [
    //       //         ClipRRect(
    //       //           borderRadius: BorderRadius.circular(10),
    //       //           child: Image.asset(
    //       //             'assets/images/1.jpg',
    //       //             height: 120.0,
    //       //             width: 120.0,
    //       //             fit: BoxFit.cover,
    //       //           ),
    //       //         ),
    //       //         Text(
    //       //           petname,
    //       //           style: TextStyle(
    //       //               color: Colors.red.shade400,
    //       //               fontSize: 16,
    //       //               fontWeight: FontWeight.normal,
    //       //               fontFamily: 'Mitr'),
    //       //         )
    //       //       ],
    //       //     ),
    //       //   ),
    //       // ),
    //     ],
    //   ),
    // );
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.red.shade100,
        child: Container(
          child: Container(
              margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
              height: 190,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: Colors.grey[200])
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black45, offset: Offset(2, 2), blurRadius: 4
                  //       // changes position of shadow
                  //       ),
                  // ],
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
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text(
                      petname,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Mitr'),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

Widget makeItem({image, title}) {
  return AspectRatio(
    aspectRatio: 1 / 1,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ])),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
