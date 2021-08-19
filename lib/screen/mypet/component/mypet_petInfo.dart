import 'package:flutter/material.dart';

class PetInfo extends StatelessWidget {
  final String text;
  final String textdetail;
  const PetInfo({Key key, @required this.text, this.textdetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.grey[200]),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Container(
          child: ListTile(
            title: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.orange.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
            subtitle: Text(
              textdetail,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
          ),
        ),
      ),
    );
  }
}
