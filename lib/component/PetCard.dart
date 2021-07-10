import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetCard extends StatefulWidget {
  @override
  final Widget child;

  PetCard({Key key, @required this.child}) : super(key: key);
  _PetCardState createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.red.shade100,
            child: Container(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 4
                          // changes position of shadow
                          ),
                    ],
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
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "ปีโป้",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red.shade400,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Mitr'),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
