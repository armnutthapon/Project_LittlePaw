import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final FontWeight fontWeight;
  final Color color;

  const CustomText(
      {Key key,
      @required this.text,
      this.textStyle,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: 'AAAA',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
