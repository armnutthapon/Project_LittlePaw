import 'package:flutter/material.dart';
import 'package:persistent_bottom/screen/clinic/clinic_detail.dart';

class ClinicCard extends StatefulWidget {
  final Padding padding;
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;
  final String inputText;

  const ClinicCard(
      {Key key,
      @required this.padding,
      this.borderRadius,
      this.boxShadow,
      this.inputText})
      : super(key: key);

  @override
  _ClinicCardState createState() => _ClinicCardState();
}

class _ClinicCardState extends State<ClinicCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Page_ClinicDetail()));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              widget.boxShadow ??
                  BoxShadow(
                      color: Colors.black45, offset: Offset(2, 2), blurRadius: 4
                      // changes position of shadow
                      ),
            ],
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/1.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                      child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "คลินิกหมอตู่",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Mitr'),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "3.5 กม.",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mitr'),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "กะทู้",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mitr'),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "เปิด : 9.00 - 21.00 น.",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mitr'),
                        )
                      ],
                    ),
                  ],
                ),
              )))
            ],
          ),
        ),
      ),
    ));
  }
}
