import 'package:flutter/material.dart';

class GridView extends StatefulWidget {
  GridView({Key key}) : super(key: key);

  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<GridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[],
    );
  }
}

class Detail {
  String name;

  Detail({this.name});
}
