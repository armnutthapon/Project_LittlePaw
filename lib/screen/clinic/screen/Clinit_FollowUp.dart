import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_paw/screen/mypet/component/mypet_petInfo.dart';

class FollowUp_Page extends StatefulWidget {
  const FollowUp_Page({Key key}) : super(key: key);

  @override
  _FollowUp_PageState createState() => _FollowUp_PageState();
}

class _FollowUp_PageState extends State<FollowUp_Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.08,
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: size.height * 0.12,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text("data"),
                      ),
                    ),
                  );
                },
                // padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            )),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(
              "ติดตามอาการ",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mitr'),
            ),
            actions: [
              // icon: Icon(Icons.exit_to_app))
            ],
            // You can add title here
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Colors.red.shade300),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}
