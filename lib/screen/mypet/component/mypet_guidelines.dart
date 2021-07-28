import 'package:flutter/material.dart';
import 'package:little_paw/screen/mypet/component/mypet_timeline.dart';

class GuideLinesPage extends StatefulWidget {
  GuideLinesPage({Key key}) : super(key: key);
  @override
  createState() => _GuideLinesState();
}

class _GuideLinesState extends State<GuideLinesPage> {
  @override
  Widget build(BuildContext context) {
    final List<TimelineModel> list = [
      TimelineModel(
        id: "1",
        title: "คลินิคหมอตู่",
        description: "ฉีดวัคซีน",
        description2: "AA",
        lineColor: Colors.red.shade400,
        descriptionColor: Colors.red,
        titleColor: Colors.black,
      ),
      TimelineModel(
        id: "1",
        title: "คลินิคหมอตู่",
        description: "ฉีดวัคซีน",
        description2: "AA",
        lineColor: Colors.red.shade400,
        descriptionColor: Colors.red,
        titleColor: Colors.black,
      ),
      TimelineModel(
        id: "1",
        title: "คลินิคหมอตู่",
        description: "ฉีดวัคซีน",
        description2: "AA",
        lineColor: Colors.red.shade400,
        descriptionColor: Colors.red,
        titleColor: Colors.black,
      ),

      // TimelineModel(
      //     id: "2",
      //     lineColor: Colors.red.shade400,
      //     description: "Flutter Interview Question \nTop 10 display",
      //     title: "Flutter Interview Question"),
      // TimelineModel(
      //     id: "3",
      //     description: "Every pattern avialble in \nwww.fluttertutorial.in",
      //     lineColor: Colors.red.shade400,
      //     title: "Flutter"),
      // TimelineModel(
      //     id: "3",
      //     description: "Every pattern avialble in \nwww.fluttertutorial.in",
      //     lineColor: Colors.red.shade400,
      //     title: "Flutter"),
      // TimelineModel(
      //     id: "3",
      //     description: "Every pattern avialble in \nwww.fluttertutorial.in",
      //     lineColor: Colors.red.shade400,
      //     title: "Flutter"),
      // TimelineModel(
      //     id: "3",
      //     description: "Every pattern avialble in \nwww.fluttertutorial.in",
      //     lineColor: Colors.red.shade400,
      //     title: "Flutter"),
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ข้อมูลวัคซีน",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mitr')),

          leading: new IconButton(
            padding: EdgeInsets.only(top: 0),
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white, //You can make this transparent
          elevation: 10.0, //No s
          // backgroundColor:
          //     Colors.white.withOpacity(0), //You can make this transparent
          // elevation: 0.0, //No shadow
        ),
        body: TimelineComponent(timelineList: list));
  }
}
