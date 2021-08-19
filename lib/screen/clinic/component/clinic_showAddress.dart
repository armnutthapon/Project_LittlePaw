import 'package:flutter/material.dart';

class ShowAddress extends StatelessWidget {
  final String topic, detail;
  const ShowAddress({Key key, @required this.topic, this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      height: size.height * 0.1,
      margin:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            text: topic,
            style: TextStyle(
              fontFamily: 'Mitr',
              fontSize: 14,
              color: Colors.orange.shade600,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: detail,
                style: TextStyle(
                  fontFamily: 'Mitr',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
