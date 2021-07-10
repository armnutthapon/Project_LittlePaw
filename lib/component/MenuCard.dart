import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuCard extends StatefulWidget {
  @override
  final Widget child;

  MenuCard({Key key, @required this.child}) : super(key: key);
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Card(
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45, offset: Offset(2, 2), blurRadius: 4
                      // changes position of shadow
                      ),
                ],
              ),
              width: 150,
              child:
                  Container(padding: EdgeInsets.all(15), child: widget.child),
            ),
          ),
        ),
      ],
    );
  }
}
