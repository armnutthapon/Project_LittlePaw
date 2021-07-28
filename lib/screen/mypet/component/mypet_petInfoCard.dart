import 'package:flutter/material.dart';

class PetInfoCard extends StatefulWidget {
  final String text;
  final String textdetail;
  const PetInfoCard({Key key, @required this.text, this.textdetail})
      : super(key: key);

  @override
  _PetInfoCardState createState() => _PetInfoCardState();
}

class _PetInfoCardState extends State<PetInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextInfo extends StatelessWidget {
  final String text;
  final String textdetail;
  const TextInfo({Key key, @required this.text, this.textdetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(width: 1.0, color: Colors.grey[200])),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 2, 5),
                // padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Mitr'),
                    ),
                    Row(
                      children: [
                        Text(
                          textdetail,
                          style: TextStyle(
                              color: Colors.red.shade400,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Mitr'),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 25,
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
