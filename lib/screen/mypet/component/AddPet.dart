import 'package:flutter/material.dart';

class Addpet_Container extends StatelessWidget {
  final String labelText;
  final String textdetail;
  const Addpet_Container({Key key, this.labelText, this.textdetail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(width: 1.0, color: Colors.grey[200]),
            ),
            child: Container(
              height: size.height * 0.08,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mitr'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: labelText,
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mitr'),
                ),
                onSaved: (String value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ชื่อสัตว์เลี้ยง';
                  }
                  return null;
                },
              ),
            )),
      ),
    );
  }
}
