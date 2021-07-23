import 'package:flutter/material.dart';

class PetCardInfo extends StatelessWidget {
  final String petname;
  const PetCardInfo({Key key, this.petname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 2),
          child: Container(
            margin: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Text(
                  petname,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Mitr'),
                ),
              ],
            ),
          )),
    );
  }
}
